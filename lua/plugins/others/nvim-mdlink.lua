local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("Nedra1998/nvim-mdlink")
    require('nvim-mdlink').setup({
        keymap = true,
        cmp = true
    })
end)
