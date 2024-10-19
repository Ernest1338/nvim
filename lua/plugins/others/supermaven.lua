local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("supermaven-inc/supermaven-nvim")
    require("supermaven-nvim").setup({})
end)
