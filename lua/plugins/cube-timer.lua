local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("Ernest1338/cube-timer.nvim")
    require("cube-timer").setup()
end)
