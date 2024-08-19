local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "folke/noice.nvim", depends = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } })
    require("noice").setup()
end)
