local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("nvim-lualine/lualine.nvim")
    require("lualine").setup({
        options = {
            theme = "gruvbox"
        }
    })
end)
