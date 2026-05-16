vim.schedule(function()
    vim.pack.add({ 'https://github.com/stevearc/dressing.nvim' })
    require("dressing").setup()
end)
