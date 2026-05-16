vim.schedule(function()
    vim.pack.add({ 'https://github.com/nvim-lualine/lualine.nvim' })
    require("lualine").setup({
        options = {
            theme = "gruvbox"
        }
    })
end)
