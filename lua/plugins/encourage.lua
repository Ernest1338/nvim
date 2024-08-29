local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("r-cha/encourage.nvim")
    require("encourage").setup()
end)
