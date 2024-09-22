local map = vim.keymap.set
local u = require("core.utils")

map("n", "K", u.lsp_key)                                                                      -- LSP key
map("n", "<leader>lf", "<cmd> lua vim.lsp.buf.format({ async = true, timeout = 2000 }) <CR>") -- Format file
map("n", "<leader>la", "<cmd> lua vim.lsp.buf.code_action() <CR>")                            -- LSP Code actions
map("n", "<leader>ld", "<cmd> Pick diagnostic <CR>")                                          -- LSP Diagnostics
map("n", "<leader>ls", "<cmd> Pick lsp scope='document_symbol' <CR>")                         -- LSP Symbols
map("n", "<leader>lr", "<cmd> lua vim.lsp.buf.rename() <CR>")                                 -- Rename
map("n", "<C-k>", "<cmd> lua vim.lsp.buf.hover() <CR>")                                       -- LSP show hover information
map("n", "gd", "<cmd> Pick lsp scope='definition' <CR>")                                      -- Go to defifinition
map("n", "gD", "<cmd> Pick lsp scope='references' <CR>")                                      -- Go to references
