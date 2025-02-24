local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "julienvincent/hunk.nvim", depends = { "MunifTanjim/nui.nvim" } })
    require("hunk").setup()
end)
