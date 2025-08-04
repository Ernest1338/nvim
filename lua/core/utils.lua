local M = {}

M.new_augrp = function(name)
    vim.api.nvim_create_augroup(name, { clear = true })
end

M.new_autocmd = vim.api.nvim_create_autocmd

M.create_new_note = function()
    local notes_dir = "~/Repos/notes/oneTimeNotes/Others/"
    local note = vim.fn.input("Note file name (.md added automatically): ") .. ".md"
    if note ~= ".md" then
        vim.cmd("edit " .. notes_dir .. note)   -- Open file in a new buf
        vim.api.nvim_set_current_dir(notes_dir) -- Change CWD to notes
    end
end

-- M.lsp_key = function()
--     local cur_line_diag_count = #vim.diagnostic.count(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
--     if cur_line_diag_count == 0 then
--         vim.lsp.buf.hover()
--     else
--         vim.diagnostic.open_float()
--     end
-- end

M.lsp_format = function()
    vim.lsp.buf.format({ async = true, timeout = 2000 })
    vim.cmd("redrawstatus")
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
