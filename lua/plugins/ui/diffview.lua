local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("sindrets/diffview.nvim")
    require("diffview").setup()
end)
