local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("olimorris/onedarkpro.nvim")
    vim.cmd("colorscheme onedark")
end)
