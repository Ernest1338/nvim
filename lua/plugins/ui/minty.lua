local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "nvzone/minty", depends = { "nvzone/volt" } })
    -- NOTE: lua require("minty.huefy").open()
end)
