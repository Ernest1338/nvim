local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("sainnhe/everforest")
    vim.cmd("colorscheme everforest")
end)
