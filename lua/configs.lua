-- colorscheme
vim.cmd("colorscheme gruvbox")

-- relative numbers
vim.wo.number = true
-- vim.wo.relativenumber = true

-- incremental search
vim.o.incsearch = true

-- hide the searches
vim.o.hlsearch = false

-- smart tab + tab width to 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.expandtab = true

-- scroll when the cursor is 4 line from the bottom
vim.o.scrolloff = 4

-- hightlight current line
vim.o.cursorline = true

-- prevent jumping of the screen
vim.wo.signcolumn = "yes"

-- enable break indent
vim.o.breakindent = true

-- case insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- decrease update time
vim.o.updatetime = 500

-- better completion experience
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- dont redraw the screen when executing macros / regexes
vim.o.lazyredraw = true

-- save undo history to a file
vim.o.undofile = true

-- automatically change CWD (should not cause issues but does - telescope project wide search breakes)
-- vim.o.autochdir = true

-- avoid disapearing status line
vim.o.showmode = false
vim.o.showcmd = false

-- set the long line highlight
vim.o.colorcolumn = "90"

-- keep the top line when creating a split
vim.o.splitkeep = "topline"

vim.o.termguicolors = true

-- folding support with treesitter
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- gives one more line to work with
vim.o.cmdheight = 0            -- switching to eg-statusline fixed the statusline disapearing problem
vim.opt.shortmess:append("cI") -- might be needed for proper cmdheight + don't show intro message

local new_augrp = function(name) vim.api.nvim_create_augroup(name, { clear = true }) end
local new_autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
local yank_grp = new_augrp("YankHighlight")
new_autocmd("TextYankPost", {
    callback = function() vim.highlight.on_yank({ timeout = 200 }) end,
    group = yank_grp,
})

-- Auto remove trailing spaces on write
local trailing_grp = new_augrp("TrailingSpaces")
new_autocmd("BufWritePre", {
    callback = function()
        local original_cursor = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, original_cursor)
    end,
    group = trailing_grp,
})

-- Override filetype for .blade.php files to php
local bladephp_grp = new_augrp("BladePHP")
new_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.blade.php",
    callback = function() vim.bo.filetype = "php" end,
    group = bladephp_grp,
})

-- NOTE: Hide the tab bar when only one buffer exists
-- vim.api.nvim_create_autocmd('BufEnter', {
--     callback = vim.schedule_wrap(function()
--         local n_listed_bufs = 0
--         for _, buf_id in ipairs(vim.api.nvim_list_bufs()) do
--             if vim.fn.buflisted(buf_id) == 1 then n_listed_bufs = n_listed_bufs + 1 end
--         end
--         vim.o.showtabline = n_listed_bufs > 1 and 2 or 0
--     end),
--     desc = 'Update tabline based on the number of listed buffers',
-- })

-- NOTE: auto format on write
-- local format_grp = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     callback = function()
--         vim.lsp.buf.format({ async = true, timeout = 2000 })
--     end,
--     group = format_grp,
-- })
