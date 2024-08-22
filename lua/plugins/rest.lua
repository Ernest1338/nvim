local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({ source = "rest-nvim/rest.nvim", depends = { "nvim-neotest/nvim-nio", "j-hui/fidget.nvim" } })
end)
