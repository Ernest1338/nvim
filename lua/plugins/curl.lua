local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "oysandvik94/curl.nvim", depends = { "nvim-lua/plenary.nvim" } })
    require("curl").setup()
end)
