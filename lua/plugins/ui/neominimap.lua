vim.schedule(function()
    vim.pack.add({
        'https://github.com/nvim-treesitter/nvim-treesitter',
        'https://github.com/lewis6991/gitsigns.nvim',
        'https://github.com/Isrothy/neominimap.nvim',
    })
    require("neominimap").setup()
    vim.cmd("Neominimap toggle")
end)
