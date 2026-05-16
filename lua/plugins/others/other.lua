vim.schedule(function()
    vim.pack.add({ 'https://github.com/rgroli/other.nvim' })
    require("other-nvim").setup({
        mappings = {
            "golang",
            "python",
            "react",
            "rust",
        }
    })
end)
