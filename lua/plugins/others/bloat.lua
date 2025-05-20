local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("dundalek/bloat.nvim")
end)
