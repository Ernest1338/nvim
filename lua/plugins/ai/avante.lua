local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({
        source = 'yetone/avante.nvim',
        monitor = 'main',
        depends = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            'echasnovski/mini.icons',
            'zbirenbaum/copilot.lua'
        },
        hooks = { post_checkout = function() vim.cmd('make') end }
    })

    require("copilot").setup()
    require("avante").setup({
        auto_suggestions_provider = "copilot",
        provider = "copilot",
        providers = {
            copilot = {
                model = "o4-mini-2025-04-16",
            },
        }
    })
end)
