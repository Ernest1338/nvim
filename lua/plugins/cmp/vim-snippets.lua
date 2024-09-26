local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("honza/vim-snippets")
end)
