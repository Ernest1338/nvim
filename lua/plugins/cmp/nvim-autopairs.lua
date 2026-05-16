vim.schedule(function()
    vim.pack.add({ 'https://github.com/windwp/nvim-autopairs' })
    require("nvim-autopairs").setup()
end)
