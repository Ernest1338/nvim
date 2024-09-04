local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("EdenEast/nightfox.nvim")
    vim.cmd("colorscheme nightfox")
end)
