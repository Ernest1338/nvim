local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "garymjr/nvim-snippets", depends = { "rafamadriz/friendly-snippets" } })
end)
