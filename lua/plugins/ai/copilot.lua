local add, later = MiniDeps.add, MiniDeps.later

later(function()
    -- Vimscript version
    add("github/copilot.vim")
    vim.cmd("Copilot restart")
    -- NOTE: run `:Copilot setup` before using

    -- Pure lua replacement
    -- add("zbirenbaum/copilot.lua")
    -- require("copilot").setup()
end)
