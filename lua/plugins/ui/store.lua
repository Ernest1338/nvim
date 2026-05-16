vim.schedule(function()
    vim.pack.add({
        'https://github.com/nvim-lua/plenary.nvim',
        'https://github.com/alex-popov-tech/store.nvim',
    })
    require("store").setup()
end)
