local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "nvim-telescope/telescope.nvim", depends = { "nvim-lua/plenary.nvim" } })
    require("telescope").setup()
end)
