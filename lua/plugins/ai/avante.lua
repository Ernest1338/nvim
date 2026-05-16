vim.schedule(function()
    vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'avante.nvim' and (kind == 'install' or kind == 'update') then
            if not ev.data.active then vim.cmd.packadd('avante.nvim') end
            vim.cmd('make')
        end
    end })

    vim.pack.add({
        'https://github.com/nvim-lua/plenary.nvim',
        'https://github.com/MunifTanjim/nui.nvim',
        'https://github.com/nvim-mini/mini.icons',
        'https://github.com/zbirenbaum/copilot.lua',
        { src = 'https://github.com/yetone/avante.nvim', version = 'main' },
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
