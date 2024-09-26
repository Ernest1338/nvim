local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("garymjr/nvim-snippets")
    -- NOTE: also enable friendly-snippets or vim-snippets
end)
