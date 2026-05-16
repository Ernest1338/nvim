local map = vim.keymap.set

vim.schedule(function()
    -- ---------------------
    -- PLUGIN
    -- ---------------------

    local api = vim.api
    local buffers, windows = {}, {}
    local size = 0.9

    local function get_float_config()
        local ui = api.nvim_list_uis()[1]
        local width = math.floor(ui.width * size)
        local height = math.floor(ui.height * size)
        return {
            relative = "editor",
            width = width,
            height = height,
            row = math.floor((ui.height - height) * 0.5 - 1),
            col = math.floor((ui.width - width) * 0.5),
            style = "minimal",
            border = size == 1 and "none" or "rounded",
        }
    end

    local function toggle_term(process)
        process = (process and process ~= "") and process or vim.o.shell
        local buf = buffers[process]

        if buf and api.nvim_buf_is_valid(buf) then
            local win = windows[process]
            if win and api.nvim_win_is_valid(win) then
                api.nvim_win_hide(win)
                windows[process] = nil
            else
                windows[process] = api.nvim_open_win(buf, true, get_float_config())
                vim.cmd("startinsert")
            end
        else
            buf = api.nvim_create_buf(false, true)
            buffers[process] = buf
            local win = api.nvim_open_win(buf, true, get_float_config())
            windows[process] = win

            vim.fn.jobstart(process, {
                term = true,
                on_exit = function()
                    if api.nvim_buf_is_valid(buf) then api.nvim_buf_delete(buf, { force = true }) end
                    if api.nvim_win_is_valid(win) then api.nvim_win_close(win, true) end
                    buffers[process] = nil
                    windows[process] = nil
                end
            })

            local augroup = api.nvim_create_augroup("termplug_" .. process, { clear = true })
            api.nvim_create_autocmd("VimResized", {
                group = augroup,
                buffer = buf,
                callback = function()
                    if windows[process] and api.nvim_win_is_valid(windows[process]) then
                        api.nvim_win_set_config(windows[process], get_float_config())
                    end
                end,
            })
            vim.cmd("startinsert")
        end
    end

    api.nvim_create_user_command("Term", function(opts)
        toggle_term(opts.args)
    end, { nargs = "*" })

    -- ---------------------
    -- CONFIGURATION
    -- ---------------------

    map({ "n", "t" }, "<A-i>", "<cmd> Term <CR>")
    map("n", "<leader>gg", "<cmd> Term lazygit <CR>")
    map({ "n", "t" }, "<C-g>", "<cmd> Term lazygit <CR>")
    map({ "n", "t" }, "<A-a>", "<cmd> Term tgpt --provider duckduckgo -i <CR>")
end)
