local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("mistweaverco/kulala.nvim")
    require("kulala").setup()
end)
