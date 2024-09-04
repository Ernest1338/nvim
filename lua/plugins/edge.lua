local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("sainnhe/edge")
    vim.cmd("colorscheme edge")
end)
