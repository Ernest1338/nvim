vim.schedule(function()
    vim.pack.add({ 'https://github.com/kosayoda/nvim-lightbulb' })
    require("nvim-lightbulb").setup({
        autocmd = { enabled = true }
    })
end)
