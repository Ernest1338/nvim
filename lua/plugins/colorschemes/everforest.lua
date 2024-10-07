local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add("sainnhe/everforest")
    vim.cmd("colorscheme everforest")
end)
