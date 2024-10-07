local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "nvchad/minty", depends = { "nvchad/volt" } })
    -- NOTE: lua require("minty.huefy").open()
end)
