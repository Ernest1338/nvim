local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("MagicDuck/grug-far.nvim")
    require("grug-far").setup({
        -- debounceMs = 0
    })
end)
