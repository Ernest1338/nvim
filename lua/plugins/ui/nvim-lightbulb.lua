local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("kosayoda/nvim-lightbulb")
    require("nvim-lightbulb").setup({
        autocmd = { enabled = true }
    })
end)
