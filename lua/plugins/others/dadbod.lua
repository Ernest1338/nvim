local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "kristijanhusak/vim-dadbod-ui", depends = { "tpope/vim-dadbod" } })
end)
