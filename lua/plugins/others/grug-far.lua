vim.schedule(function()
    vim.pack.add({ 'https://github.com/MagicDuck/grug-far.nvim' })
    require("grug-far").setup({
        -- debounceMs = 0
    })
end)
