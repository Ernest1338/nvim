local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("Isrothy/neominimap.nvim")
    require("neominimap").setup()
end)
