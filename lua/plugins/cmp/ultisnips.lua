local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("SirVer/ultisnips")
    -- NOTE: also enable friendly-snippets or vim-snippets
end)
