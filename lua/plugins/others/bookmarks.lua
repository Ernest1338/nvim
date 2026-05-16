vim.schedule(function()
    vim.pack.add({ 'https://github.com/tomasky/bookmarks.nvim' })
    require("bookmarks").setup()
end)
