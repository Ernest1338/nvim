local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "folke/todo-comments.nvim", depends = { "nvim-lua/plenary.nvim" } })
    require("todo-comments").setup()
end)
