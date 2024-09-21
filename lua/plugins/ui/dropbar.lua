local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("Bekaboo/dropbar.nvim")
    require("dropbar").setup()
end)
