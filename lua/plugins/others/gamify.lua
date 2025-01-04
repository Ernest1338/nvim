local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("GrzegorzSzczepanek/gamify.nvim")
    require("gamify")
end)
