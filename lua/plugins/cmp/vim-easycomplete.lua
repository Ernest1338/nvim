local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("jayli/vim-easycomplete")
    -- NOTE: enable ultisnips for snippet support
    vim.g.easycomplete_nerd_font = 1
end)
