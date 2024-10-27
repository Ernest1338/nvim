local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("stevearc/conform.nvim")
    require("conform").setup({
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            rust = { "rustfmt", lsp_format = "fallback" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
        },
    })
end)
