local u = require("core.utils")

-- Colorscheme
vim.cmd("colorscheme tokyonight")

-- Relative numbers
vim.wo.number = true
-- vim.wo.relativenumber = true

-- Incremental search
vim.o.incsearch = true

-- Hide the searches
vim.o.hlsearch = false

-- Smart tab + tab width to 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.expandtab = true

-- No text wrap
-- vim.o.wrap = false

-- Scroll when the cursor is 4 line from the bottom
vim.o.scrolloff = 4

-- Hightlight current line
vim.o.cursorline = true

-- Prevent jumping of the screen
vim.wo.signcolumn = "yes"

-- Enable break indent
vim.o.breakindent = true

-- Case insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 1000

-- Better completion experience
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Dont redraw the screen when executing macros / regexes
vim.o.lazyredraw = true

-- Save undo history to a file
vim.o.undofile = true

-- Automatically change CWD (should not cause issues but does - telescope project wide search breakes)
-- vim.o.autochdir = true

-- Avoid disapearing status line
vim.o.showmode = false
vim.o.showcmd = false

-- Set the long line highlight
vim.o.colorcolumn = "90"

-- Keep the top line when creating a split
vim.o.splitkeep = "topline"

vim.o.termguicolors = true

vim.o.winborder = "rounded"

-- Highlight spaces as dots at the beginning of a lnie
vim.opt.listchars:append({ lead = "·" })
vim.opt.list = true

-- Folding support with treesitter
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- gives one more line to work with
vim.o.cmdheight = 0
vim.opt.shortmess:append("cI")

-- Highlight on yank
u.new_autocmd("TextYankPost", {
    callback = function() vim.hl.on_yank({ timeout = 200 }) end,
    group = u.new_augrp("YankHighlight"),
})

-- Auto remove trailing spaces on write
u.new_autocmd("BufWritePre", {
    callback = function()
        local original_cursor = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, original_cursor)
    end,
    group = u.new_augrp("TrailingSpaces"),
})

-- Enable virtual text for errors on current line
vim.diagnostic.config({
    virtual_text = {
        current_line = true,
        prefix = "•",
        severity = "ERROR"
    }
})

-- Hide numbers on terminal buffers
-- u.new_autocmd("TermOpen", {
--     callback = function()
--         vim.opt_local.relativenumber = false
--         vim.opt_local.number = false
--     end,
--     group = u.new_augrp("CustomTerm"),
-- })

-- Hide the tab bar when only one buffer exists
-- u.new_autocmd('BufEnter', {
--     callback = vim.schedule_wrap(function()
--         local n_listed_bufs = 0
--         for _, buf_id in ipairs(vim.api.nvim_list_bufs()) do
--             if vim.fn.buflisted(buf_id) == 1 then n_listed_bufs = n_listed_bufs + 1 end
--         end
--         vim.o.showtabline = n_listed_bufs > 1 and 2 or 0
--     end),
--     desc = 'Update tabline based on the number of listed buffers',
--     group = u.new_augrp("HideTabBar"),
-- })

-- Auto format on write
-- u.new_autocmd("BufWritePre", {
--     callback = function() vim.lsp.buf.format({ async = false, timeout = 2000 }) end,
--     group = u.new_augrp("FormatOnSave"),
-- })
