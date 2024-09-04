local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("folke/tokyonight.nvim")
    vim.cmd("colorscheme tokyonight-night")
end)
