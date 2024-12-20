local add, later = MiniDeps.add, MiniDeps.later

-- NOTE: disable mini.icons lsp kind prepend for this plugin to work

later(function()
    add({
        source = "Saghen/blink.cmp",
        checkout = "v0.7.6",
        -- Optional
        depends = { "rafamadriz/friendly-snippets" }
    })

    require("blink.cmp").setup({
        keymap = {
            select_prev = { '<S-Tab>', '<Up>', '<C-k>' },
            select_next = { '<Tab>', '<Down>', '<C-j>' },
            accept = { '<Enter>' },
            scroll_documentation_up = { '<C-u>' },
            scroll_documentation_down = { '<C-d>' },
        },
        trigger = {
            signature_help = {
                enabled = true
            }
        },
        windows = {
            autocomplete = {
                border = 'rounded',
                draw = 'reversed',

            },
            documentation = {
                border = 'rounded',
            }
        }
    })
end)
