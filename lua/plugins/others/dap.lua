local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "rcarriga/nvim-dap-ui", depends = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "igorlfs/nvim-dap-view" } })
end)
