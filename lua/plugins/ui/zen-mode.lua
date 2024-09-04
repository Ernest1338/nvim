local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("folke/zen-mode.nvim")
end)
