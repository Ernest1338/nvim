local map = vim.keymap.set
local u = require("core.utils")

-- map leader key as space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NOTE: <leader>k - special group of bindings (can be eventually)

map({ "i", "t" }, "<C-k>", "<up>")                                                               -- <C-k> to move up
map({ "i", "t" }, "<C-j>", "<down>")                                                             -- <C-j> to move down
map({ "i", "t" }, "<C-h>", "<left>")                                                             -- <C-h> to move left
map({ "i", "t" }, "<C-l>", "<right>")                                                            -- <C-l> to move right
map("n", "<leader>fd", "<cmd> Pick grep_live <CR>")                                              -- Search project
map("n", "<leader>fD", "<cmd> Pick buf_lines scope='current' <CR>")                              -- Search current file
map("n", "<leader>fs", "<cmd>:silent w<CR>")                                                     -- Save file
map("n", "<leader><leader>", "<cmd> Pick files <CR>")                                            -- Find files
map("n", "<leader>qq", "<cmd> q <CR>")                                                           -- Quit
map("n", "<leader>qQ", "<cmd> q! <CR>")                                                          -- Force quit
map("n", "<leader>fc", "<cmd> Pick files cwd='~/.config/nvim/' <CR>")                            -- Modify config
map("n", "<leader>ft", "<cmd> Pick filetype <CR>")                                               -- Change file type
map("n", "<leader>fr", "<cmd> edit! <CR>")                                                       -- Reload file
map("n", "<leader>of", "<cmd> Pick explorer cwd='$HOME' <CR>")                                   -- Open file
map("n", "<leader>ot", "<cmd> Pick hipatterns scope='all' <CR>")                                 -- Open TODOs and similar
map("n", "<leader>:", "<cmd> Pick commands <CR>")                                                -- Pick commands
map("n", "<leader>sh", "<cmd> split <CR>")                                                       -- Horizontal split
map("n", "<leader>sv", "<cmd> vsplit <CR>")                                                      -- Vertical split
map("n", "<leader>wd", "<cmd> close <CR>")                                                       -- Window close
map("n", "<leader>bb", "<cmd> Pick buffers <CR>")                                                -- Buffers
map("n", "<leader>bz", "<cmd> lua require('mini.misc').zoom() <CR>")                             -- Zoom current buffer
map("n", "<leader>co", "<cmd> Pick colorscheme <CR>")                                            -- Choose colorscheme
map("n", "<leader>nn", "<cmd> cd ~/Repos/notes/ <CR><cmd> Pick files cwd='~/Repos/notes/' <CR>") -- Browse notes
map("n", "<leader>nc", u.create_new_note)                                                        -- Create new note and open it
map("n", "<leader>tb", u.toggle_tabline)                                                         -- Show / hide tab bar
map("n", "<leader>td", "<cmd> bdelete <CR>")                                                     -- Delete current buffer (and tab)
map("n", "<f2>", "<cmd> Pick keymaps <CR>")                                                      -- Show keymaps
map("n", "<f3>", "<cmd> Pick help <CR>")                                                         -- Neovim help pages
map("n", "<tab>", "<cmd> bnext <CR>")                                                            -- Next buffer
map("n", "<S-tab>", "<cmd> bprev <CR>")                                                          -- Previous buffer
map("v", "Y", "\"+ygv<esc>")                                                                     -- Y To copy to system clipboard
map({ "n", "v" }, "<C-d>", "<C-d>zz")                                                            -- Center C-d
map({ "n", "v" }, "<C-u>", "<C-u>zz")                                                            -- Center C-u
map("n", "n", "nzzzv")                                                                           -- Center search
map("n", "N", "Nzzzv")                                                                           -- Center backwards search
map("v", "y", "ygv<esc>")                                                                        -- Prevent cursor jump when copying
map("n", ";", "<cmd> Pick commands <CR>")                                                        -- Quick command
map("t", "<A-Esc>", "<C-\\><C-n>")                                                               -- Terminal enter normal mode

-- map("n", "<leader>fR", "<cmd> Pick oldfiles <CR>")                                               -- Recent files
-- map("n", "<leader>tj", "<cmd> Pick list scope='jump' <CR>") -- Jumplist
-- map("n", "<C-e>", function() vim.print(vim.treesitter.get_captures_at_cursor(0)) end)            -- Show highlight group at cursor
