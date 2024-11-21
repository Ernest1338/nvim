local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("nvzone/showkeys")
    require("showkeys").setup({
        timeout = 5,
        maxkeys = 5,
    })
end)
