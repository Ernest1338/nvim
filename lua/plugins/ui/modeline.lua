local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("nvimdev/modeline.nvim")
    require("modeline").setup()
end)
