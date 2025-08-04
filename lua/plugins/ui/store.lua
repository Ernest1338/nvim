local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "alex-popov-tech/store.nvim", depends = { "nvim-lua/plenary.nvim" } })
    require("store").setup()
end)
