local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add("EdenEast/nightfox.nvim")
    vim.cmd("colorscheme nightfox")
end)
