local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "azratul/live-share.nvim", depends = { "jbyuki/instant.nvim" } })
    require("live-share").setup({
        port_internal = 8765,
        max_attempts = 40, -- 10 seconds
        service = "serveo.net"
    })
end)
