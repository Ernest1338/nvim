local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add({ source = "nvim-neo-tree/neo-tree.nvim", depends = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" } })
    require("neo-tree").setup()
    -- vim.cmd("Neotree")
end)
