local M = {}

M.new_augrp = function(name)
    vim.api.nvim_create_augroup(name, { clear = true })
end

M.new_autocmd = vim.api.nvim_create_autocmd

M.ask_ai = function(prompt, context, only_code)
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_set_option_value('filetype', 'markdown', { buf = buf })
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "Thinking..." })
    vim.api.nvim_set_current_buf(buf)

    local provider = "duckduckgo" -- phind by default
    if context ~= nil and #context > 0 then
        prompt = context .. '\n' .. prompt
    end

    local additional = '-q' -- quiet
    if only_code == true then
        additional = '-c'   -- only code (quiet mode doesn't support -c)
    end

    vim.system({ 'tgpt', '--provider', provider, additional, '\'' .. prompt .. '\'' }, { text = true }, function(o)
        if o.code ~= 0 then
            o.stdout = "Failed to execute TGPT: " .. o.stderr
        end
        local lines = vim.split(o.stdout:gsub("\r", ""), "\n")
        vim.schedule(function()
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        end)
    end)
end

M.get_current_selection = function()
    local mode = vim.fn.mode()
    local selection = {}
    if mode == "v" or mode == "V" then
        local vstart = vim.fn.getpos("v")
        local vend = vim.fn.getpos(".")
        if mode == "V" then
            local line_num = vim.fn.line('.')
            vend = { 0, line_num, vim.fn.col('$'), 0 }
        end
        selection = vim.fn.getregion(vstart, vend)
    end
    return table.concat(selection, '\n')
end

M.get_lines_cur_buf = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    return table.concat(lines, '\n')
end

M.get_cur_sel_or_buf = function()
    local context = M.get_current_selection()
    if #context == 0 then
        context = M.get_lines_cur_buf()
    end
    return context
end

M.create_new_note = function()
    local notes_dir = "~/Repos/notes/oneTimeNotes/Others/"
    local note = vim.fn.input("Note file name (.md added automatically): ") .. ".md"
    if note ~= ".md" then
        vim.cmd("edit " .. notes_dir .. note)   -- Open file in a new buf
        vim.api.nvim_set_current_dir(notes_dir) -- Change CWD to notes
    end
end

M.runtime_add = function(path)
    vim.o.runtimepath = vim.o.runtimepath .. "," .. path
end

M.toggle_tabline = function()
    if vim.o.showtabline ~= 0 then
        vim.o.showtabline = 0
    else
        vim.o.showtabline = 2
    end
end

return M
