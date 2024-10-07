local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add("olimorris/onedarkpro.nvim")
    vim.cmd("colorscheme onedark")
end)
