vim.schedule(function()
    vim.pack.add({ 'https://github.com/nvzone/showkeys' })
    require("showkeys").setup({
        timeout = 5,
        maxkeys = 5,
    })
end)
