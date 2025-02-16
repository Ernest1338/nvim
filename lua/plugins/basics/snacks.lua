local add, later = MiniDeps.add, MiniDeps.later
local map = vim.keymap.set

later(function()
    add("folke/snacks.nvim")
    -- require("snacks.dashboard").setup({
    --     sections = {
    --         { section = "header" },
    --         { section = "keys",   gap = 1, padding = 1 },
    --         { section = "startup" },
    --     },
    -- })

    require("snacks.explorer").setup({ replace_netrw = true })
    map("n", "<C-f>", "<Cmd>lua Snacks.explorer()<CR>")                                     -- Open file tree
    map("n", "<leader>fc", "<Cmd>lua Snacks.picker.files({ cwd = '~/.config/nvim/' })<CR>") -- Edit configs
    map("n", "<f2>", "<Cmd>lua Snacks.picker.keymaps() <CR>")                               -- Show keymaps

    require("snacks.indent").enable()

    require("snacks.input").enable()

    map("n", "<leader>gg", "<Cmd>lua Snacks.lazygit()<CR>") -- Open lazygit
    map("n", "<C-g>", "<Cmd>lua Snacks.lazygit()<CR>")      -- Open lazygit

    vim.notify = Snacks.notifier.notify
    vim.api.nvim_create_autocmd("LspProgress", {
        ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
        callback = function(ev)
            local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
            vim.notify(vim.lsp.status(), "info", {
                id = "lsp_progress",
                title = "LSP Progress",
                opts = function(notif)
                    notif.icon = ev.data.params.value.kind == "end" and " "
                        or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
                end,
            })
        end,
    })

    map("n", "<leader><leader>", "<Cmd>lua Snacks.picker.files()<CR>")
    map("n", "<leader>bb", "<Cmd>lua Snacks.picker.buffers()<CR>")
    map("n", "<leader>co", "<Cmd>lua Snacks.picker.colorschemes()<CR>")
    map("n", ";", "<Cmd>lua Snacks.picker.commands()<CR>")
    map("n", "<leader>ld", "<Cmd>lua Snacks.picker.diagnostics()<CR>")
    map("n", "<leader>fd", "<Cmd>lua Snacks.picker.grep()<CR>")
    map("n", "<leader>fD", "<Cmd>lua Snacks.picker.lines()<CR>")

    require("snacks.scroll").enable()

    map({ "n", "t" }, "<A-i>", "<Cmd>lua Snacks.terminal.toggle('bash', { win = { style = 'float' } })<CR>")

    require("snacks.words").enable()
end)
