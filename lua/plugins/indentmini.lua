local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("nvimdev/indentmini.nvim")
    require("indentmini").setup()

    vim.cmd('hi! link IndentLine LineNr')
    -- NOTE: uncomment for highlighting current indent
    -- vim.cmd('hi! link IndentLineCurrent LineNr')
end)
