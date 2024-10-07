local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add("projekt0n/github-nvim-theme")
    vim.cmd("colorscheme github_dark")
end)
