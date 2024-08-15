local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("f-person/git-blame.nvim")
end)
