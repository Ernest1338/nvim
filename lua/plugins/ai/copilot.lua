local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("github/copilot.vim")
    vim.cmd("Copilot restart")
    -- NOTE: run `:Copilot setup` before using
end)
