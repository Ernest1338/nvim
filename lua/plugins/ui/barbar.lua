local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("romgrk/barbar.nvim")
    require("barbar").setup()
end)
