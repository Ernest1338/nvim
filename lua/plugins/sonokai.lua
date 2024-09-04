local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("sainnhe/sonokai")
    vim.cmd("colorscheme sonokai")
end)
