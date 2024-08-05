local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("nvimdev/epo.nvim")
    require("epo").setup()
end)
