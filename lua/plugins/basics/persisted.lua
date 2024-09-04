local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add("olimorris/persisted.nvim")
    require("persisted").setup({
        autoload = true,
    })
end)
