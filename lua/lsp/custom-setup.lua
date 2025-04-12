local servers = {
    lua = {
        filetypes = { "lua" },
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
                    globals = { "vim", "jit", "MiniPick", "MiniDeps", "MiniFiles", "MiniIcons", "MiniTabline", "MiniCompletion" },
                }
            }
        }
    },

    rust = {
        filetypes = { "rust" },
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
        filetypes = { "python" },
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

    typescript = {
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" },
        root_files = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
    },

    c = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        cmd = { "clangd" },
        root_files = { "Makefile", ".clangd", ".clang-tidy", ".clang-format", ".git" },
    },

    -- vue = {
    --     filetypes = { "vue" },
    --     cmd = { "vue-language-server", "--stdio" },
    --     root_files = { "node_modules", "package.json", ".git" },
    -- },

    go = {
        filetypes = { "go" },
        cmd = { "gopls" },
        root_files = { "go.work", "go.mod", ".git" },
    }
}

for name, config in pairs(servers) do
    config.on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil
        require("lsp.mappings")
    end

    config.on_init = function(client)
        client.settings = config.settings
    end

    vim.lsp.config[name] = {
        cmd = config.cmd,
        root_markers = config.root_files,
        filetypes = config.filetypes,
        settings = config.settings,
        on_attach = config.on_attach,
        on_init = config.on_init,
    }

    vim.lsp.enable(name)
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

vim.api.nvim_create_user_command("LspInfo", function()
    local current_buf = vim.api.nvim_get_current_buf()
    local active = vim.lsp.get_clients({ bufnr = current_buf })
    if #active == 0 then
        vim.print("No LSP servers active")
    else
        local active_num = #active
        active = active[1]
        vim.print("Active LSP server (" ..
            active_num .. " server/s) => [" .. active.config.name .. "] " .. active.config.cmd[1])
    end
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
