local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "NeogitOrg/neogit", depends = { "nvim-lua/plenary.nvim" } })
    require("neogit").setup()
end)
