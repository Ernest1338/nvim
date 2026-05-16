vim.schedule(function()
    vim.pack.add({ 'https://github.com/r-cha/encourage.nvim' })
    require("encourage").setup()
end)
