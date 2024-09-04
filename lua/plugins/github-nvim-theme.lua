local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("projekt0n/github-nvim-theme")
    vim.cmd("colorscheme github_dark")
end)
