vim.schedule(function()
    vim.pack.add({ 'https://github.com/lewis6991/gitsigns.nvim' })
    require("gitsigns").setup()
end)
