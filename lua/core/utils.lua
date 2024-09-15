local M = {}

M.new_augrp = function(name)
    vim.api.nvim_create_augroup(name, { clear = true })
end

M.new_autocmd = vim.api.nvim_create_autocmd

M.ask_ai = function(prompt, context)
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_option_value('filetype', 'markdown', { buf = buf })
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "Thinking..." })
    vim.api.nvim_set_current_buf(buf)
    local provider = "duckduckgo" -- phind by default
    if context ~= nil and #context > 0 then
        prompt = context .. '\n' .. prompt
    end
    vim.system({ 'tgpt', '--provider', provider, '-q', prompt }, { text = true }, function(o)
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
    return selection
end

M.create_new_note = function()
    local notes_dir = "~/Repos/notes/oneTimeNotes/Others/"
    local note = vim.fn.input("Note file name (.md added automatically): ") .. ".md"
    if note ~= ".md" then
        vim.cmd("edit " .. notes_dir .. note)   -- Open file in a new buf
        vim.api.nvim_set_current_dir(notes_dir) -- Change CWD to notes
    end
end

return M
