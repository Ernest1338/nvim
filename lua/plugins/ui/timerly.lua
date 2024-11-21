local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "nvzone/timerly", depends = { "nvzone/volt" } })
end)
