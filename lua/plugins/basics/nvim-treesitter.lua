local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "nvim-treesitter/nvim-treesitter", hooks = { post_checkout = function() vim.cmd('TSUpdate') end } })
    require("nvim-treesitter.configs").setup {
        highlight = { enable = true, },
        indent = { enable = true },
    }
end)
