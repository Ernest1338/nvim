local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add("navarasu/onedark.nvim")
    vim.cmd("colorscheme onedark")
end)
