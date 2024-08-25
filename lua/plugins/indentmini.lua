local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("nvimdev/indentmini.nvim")
    require("indentmini").setup({
        char = '┆',
        -- exclude = {},
        minlevel = 2,
        -- only_current = true,
    })

    vim.cmd('hi! link IndentLine LineNr')
    -- NOTE: uncomment to not highlight current indent
    vim.cmd('hi! link IndentLineCurrent LineNr')
end)
