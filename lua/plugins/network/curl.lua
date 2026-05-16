vim.schedule(function()
    vim.pack.add({
        'https://github.com/nvim-lua/plenary.nvim',
        'https://github.com/oysandvik94/curl.nvim',
    })
    require("curl").setup()
end)
