vim.schedule(function()
    vim.pack.add({
        'https://github.com/MunifTanjim/nui.nvim',
        'https://github.com/rcarriga/nvim-notify',
        'https://github.com/folke/noice.nvim',
    })
    vim.o.lazyredraw = false
    require("noice").setup()
end)
