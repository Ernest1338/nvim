local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "Isrothy/neominimap.nvim", depends = { "nvim-treesitter/nvim-treesitter", "lewis6991/gitsigns.nvim" } })
    require("neominimap").setup()
    vim.cmd("Neominimap toggle")
end)
