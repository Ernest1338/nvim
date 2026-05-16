vim.schedule(function()
    vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })
    require("conform").setup({
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            rust = { "rustfmt", lsp_format = "fallback" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
        },
    })
end)
