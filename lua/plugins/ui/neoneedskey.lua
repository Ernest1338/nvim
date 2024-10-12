local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("zSnails/NeoNeedsKey")
    require("NeoNeedsKey").setup()
end)
