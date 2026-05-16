vim.schedule(function()
    vim.pack.add({ 'https://github.com/nvimdev/modeline.nvim' })
    require("modeline").setup()
end)
