local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add("sainnhe/sonokai")
    vim.cmd("colorscheme sonokai")
end)
