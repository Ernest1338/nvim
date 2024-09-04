local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("catppuccin/nvim")
    vim.cmd("colorscheme catppuccin")
end)
