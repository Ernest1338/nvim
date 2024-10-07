local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add("sainnhe/edge")
    vim.cmd("colorscheme edge")
end)
