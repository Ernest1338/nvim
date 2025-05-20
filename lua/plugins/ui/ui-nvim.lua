local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("OXY2DEV/ui.nvim")
    require("ui").setup()
end)
