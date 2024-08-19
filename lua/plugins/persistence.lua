local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("folke/persistence.nvim")
    require("persistence").setup()
end)
