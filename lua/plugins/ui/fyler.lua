local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("A7Lavinraj/fyler.nvim")
    require("fyler").setup({})
end)
