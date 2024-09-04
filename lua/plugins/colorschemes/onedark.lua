local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("navarasu/onedark.nvim")
    vim.cmd("colorscheme onedark")
end)
