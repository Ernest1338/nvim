local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add("catppuccin/nvim")
    vim.cmd("colorscheme catppuccin")
end)
