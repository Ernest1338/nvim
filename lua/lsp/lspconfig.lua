MiniDeps.add("neovim/nvim-lspconfig")
local lspconfig = require("lspconfig")

local on_attach = function(client, _) -- _ = bufnr
    -- disabled, because it breaks highlighting and makes it slugish
    client.server_capabilities.semanticTokensProvider = nil
    require("lsp.mappings")
end

local servers = {
    rust_analyzer = {
        ["rust_analyzer"] = {
            diagnostics = {
                enable = true,
                disabled = { "unresolved-proc-macro" },
                --enableExperimental = true,
            }
        }
    },
    pylsp = {
        ["pylsp"] = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 120,
                    ignore = { "E265", "E722" }
                },
                mccabe = { enabled = false }
            }
        }
    },
    lua_ls = {
        Lua = {
            diagnostics = {
                globals = { "vim", "jit", "MiniPick", "MiniDeps", "MiniFiles", "MiniIcons", "MiniTabline", "MiniCompletion" },
            },
        },
    },
    gopls = {},
    ts_ls = {},
    -- volar = {},
    -- ruff = {},
    -- ruff_lsp = {},
    -- zls = {},
    -- clangd = {}
}

for server, settings in pairs(servers) do
    lspconfig[server].setup {
        on_attach = on_attach,
        settings = settings
    }
end

-- Auto start lsp on single file sessions
vim.cmd("LspStart")
