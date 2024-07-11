local servers = {
    lua = {
        pattern = "lua",
        cmd = { "lua-language-server" },
        root_files = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                workspace = {
                    checkThirdParty = false,
                    library = { vim.env.VIMRUNTIME }
                },
                diagnostics = {
                    globals = { "vim", "jit", "MiniPick", "MiniDeps", "MiniFiles" },
                }
            }
        }
    },
    rust = {
        pattern = "rust",
        cmd = { "rust-analyzer" },
        root_files = { "Cargo.toml", "rust-project.json", ".git" },
        settings = {
            ["rust_analyzer"] = {
                diagnostics = {
                    enable = true,
                    disabled = { "unresolved-proc-macro" },
                    --enableExperimental = true,
                }
            }
        }
    },
    python = {
        pattern = "python",
        cmd = { "pylsp" },
        root_files = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
        settings = {
            ["pylsp"] = {
                plugins = {
                    pycodestyle = {
                        maxLineLength = 120,
                        ignore = { "E265", "E722" }
                    },
                    mccabe = { enabled = false }
                }
            }
        }
    },
    go = {
        pattern = "go",
        cmd = { "gopls" },
        root_files = { "go.work", "go.mod", ".git" },
        settings = {}
    }
}

local function start_lsp(name, cmd, root_files, settings)
    local on_attach = function(client, _) -- _ = bufnr
        -- disabled, because it breaks highlighting and makes it slugish
        client.server_capabilities.semanticTokensProvider = nil
    end

    local on_init = function(client)
        client.settings = settings
    end

    local root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1])
    local client = vim.lsp.start({
        name = name,
        cmd = cmd,
        root_dir = root_dir,
        on_attach = on_attach,
        on_init = on_init
    })
    assert(client)

    vim.lsp.buf_attach_client(0, client)
end

local function setup_lsp(name, pattern, cmd, root_files, settings)
    vim.api.nvim_create_autocmd("FileType", {
        pattern = pattern,
        callback = function()
            start_lsp(name, cmd, root_files, settings)

            local map = vim.keymap.set
            map("n", "K", function()
                if #vim.lsp.diagnostic.get_line_diagnostics() == 0 then
                    vim.lsp.buf.hover()
                else
                    vim.diagnostic.open_float()
                end
            end)                                                                                          -- LSP button
            map("n", "<leader>lf", "<cmd> lua vim.lsp.buf.format({ async = true, timeout = 2000 }) <CR>") -- Format file
            map("n", "<leader>la", "<cmd> lua vim.lsp.buf.code_action() <CR>")                            -- LSP Code actions
            map("n", "<leader>ld", "<cmd> Pick diagnostic <CR>")                                          -- LSP Diagnostics
            map("n", "<leader>ls", "<cmd> Pick lsp scope='document_symbol' <CR>")                         -- LSP Symbols
            map("n", "<leader>lr", "<cmd> lua vim.lsp.buf.rename() <CR>")                                 -- Rename
            map("n", "<C-k>", "<cmd> lua vim.lsp.buf.hover() <CR>")                                       -- LSP show hover information
            map("n", "gd", "<cmd> Pick lsp scope='definition' <CR>")                                      -- Go to defifinition
            map("n", "gD", "<cmd> Pick lsp scope='references' <CR>")                                      -- Go to references
        end
    })
end

vim.api.nvim_create_user_command("LspStop", function()
    local current_buf = vim.api.nvim_get_current_buf()
    vim.lsp.stop_client(vim.lsp.get_clients({ bufnr = current_buf }))
end, {
    desc = "Manually stops the given language client(s)",
    nargs = "?",
})

vim.api.nvim_create_user_command("LspRestart", function()
    local current_buf = vim.api.nvim_get_current_buf()
    vim.lsp.stop_client(vim.lsp.get_clients({ bufnr = current_buf }))
    vim.cmd("edit")
end, {
    desc = "Restart LSP connected to current buffer",
    nargs = "?",
})

vim.api.nvim_create_user_command("LspStart", function()
    local ftype = vim.o.filetype
    for name, config in pairs(servers) do
        if config.pattern == ftype then
            start_lsp(name, config.cmd, config.root_files, config.settings)
            return
        end
    end
end, {
    desc = "Manually start LSP server if possible and attach to current buffer",
    nargs = "?",
})

vim.api.nvim_create_user_command("LspInfo", function()
    local current_buf = vim.api.nvim_get_current_buf()
    local active = vim.lsp.get_clients({ bufnr = current_buf })
    if #active == 0 then
        vim.print("No LSP servers active")
        return
    end
    active = active[1]
    vim.print("Active LSP server: [" .. active.config.name .. "] " .. active.config.cmd[1])
    vim.print("\nConfigured LSP servers:")
    for name, config in pairs(servers) do
        vim.print("- [" .. name .. "] " .. config.cmd[1])
    end
end, {
    desc = "Print active LSP server",
    nargs = "?",
})

vim.api.nvim_create_user_command("LspLog", function()
    local log_fname = vim.lsp.log.get_filename()
    vim.cmd("edit " .. log_fname)
end, {
    desc = "Open LSP logs",
    nargs = "?",
})

for name, config in pairs(servers) do
    setup_lsp(name, config.pattern, config.cmd, config.root_files, config.settings)
end
