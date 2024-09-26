local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("dcampos/nvim-snippy")
    require("snippy").setup({
        mappings = {
            is = {
                ['<Tab>'] = 'expand_or_advance',
                ['<S-Tab>'] = 'previous',
            },
            nx = {
                ['<leader>x'] = 'cut_text',
            },
        },
    })
end)
