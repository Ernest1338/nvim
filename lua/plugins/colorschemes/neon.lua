local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add("Zeioth/neon.nvim")
    vim.cmd("colorscheme neon")
end)
