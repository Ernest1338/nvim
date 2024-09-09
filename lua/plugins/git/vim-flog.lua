local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "rbong/vim-flog", depends = { "tpope/vim-fugitive" } })
end)
