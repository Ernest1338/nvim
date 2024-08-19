local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("folke/trouble.nvim")
    require("trouble").setup()
end)
