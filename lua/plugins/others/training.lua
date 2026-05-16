vim.schedule(function()
    vim.pack.add({ 'https://github.com/Ernest1338/training.nvim' })
    require("training").setup()
end)
