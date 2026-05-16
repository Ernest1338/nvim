vim.schedule(function()
    vim.pack.add({
        'https://github.com/MunifTanjim/nui.nvim',
        'https://github.com/m4xshen/hardtime.nvim',
    })
    require("hardtime").setup()
end)
