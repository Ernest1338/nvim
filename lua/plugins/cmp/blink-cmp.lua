local add, later = MiniDeps.add, MiniDeps.later

-- NOTE: disable mini.icons lsp kind prepend for this plugin to work

later(function()
    add({
        source = "Saghen/blink.cmp",
        checkout = "v0.2.0",
        -- Optional
        depends = { "rafamadriz/friendly-snippets" }
    })

    require("blink.cmp").setup({
        keymap = {
            select_prev = { '<Up>', '<C-k>' },
            select_next = { '<Down>', '<C-j>' },
            scroll_documentation_up = '<C-u>',
            scroll_documentation_down = '<C-d>',
        },
    })
end)
