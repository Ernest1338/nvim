local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "folke/noice.nvim", depends = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } })
    vim.o.lazyredraw = false
    require("noice").setup()
end)
