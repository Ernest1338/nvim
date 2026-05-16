vim.schedule(function()
    vim.pack.add({ 'https://github.com/folke/persistence.nvim' })
    require("persistence").setup()
end)
