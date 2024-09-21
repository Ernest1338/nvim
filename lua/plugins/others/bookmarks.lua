local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("tomasky/bookmarks.nvim")
    require("bookmarks").setup()
end)
