vim.schedule(function()
    vim.pack.add({
        'https://github.com/rafamadriz/friendly-snippets',
        { src = 'https://github.com/Saghen/blink.cmp', version = 'v1.6.0' },
    })

    require("blink.cmp").setup({
        keymap = {
            preset = 'enter',
            ['<S-Tab>'] = { 'select_prev' },
            ['<Tab>'] = { 'select_next' },
            ['<Up>'] = { 'select_prev' },
            ['<Down>'] = { 'select_next' },
            ['<C-k>'] = { 'select_prev' },
            ['<C-j>'] = { 'select_next' },
            ['<C-u>'] = { 'scroll_documentation_up' },
            ['<C-d>'] = { 'scroll_documentation_down' },
        },
        signature = { enabled = true },
        completion = {
            menu = { border = 'rounded' },
            documentation = { auto_show = true, window = { border = 'rounded' } }
        },
    })
end)
