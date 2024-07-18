local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("Ernest1338/mini.pickaproject")
    require("mini.pickaproject").setup()
end)
