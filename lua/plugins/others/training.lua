local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("Ernest1338/training.nvim")
    require("training").setup()
end)
