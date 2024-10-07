local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add({ source = "zenbones-theme/zenbones.nvim", depends = { "rktjmp/lush.nvim" } })
    vim.cmd("colorscheme zenbones")
end)
