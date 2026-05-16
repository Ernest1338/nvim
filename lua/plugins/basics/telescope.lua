vim.schedule(function()
    vim.pack.add({
        'https://github.com/nvim-lua/plenary.nvim',
        'https://github.com/nvim-telescope/telescope.nvim',
    })
    require("telescope").setup()
end)
