vim.schedule(function()
    vim.pack.add({ 'https://github.com/askfiy/http-client.nvim' })
    require("http-client").setup()
end)
