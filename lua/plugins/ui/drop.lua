vim.schedule(function()
    vim.pack.add({ 'https://github.com/folke/drop.nvim' })
    -- NOTE: some dashboard plugin needs to be enabled
    require("drop").setup()
end)
