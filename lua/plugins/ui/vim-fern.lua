local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("lambdalisue/vim-fern")
    vim.cmd("Fern .")
end)
