local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add("stevearc/oil.nvim")
    require("oil").setup()
end)
