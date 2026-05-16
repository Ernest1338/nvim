vim.schedule(function()
    -- Vimscript version
    vim.pack.add({ 'https://github.com/github/copilot.vim' })
    vim.cmd("Copilot restart")
    -- NOTE: run `:Copilot setup` before using

    -- Pure lua replacement
    -- vim.pack.add({ 'https://github.com/zbirenbaum/copilot.lua' })
    -- require("copilot").setup()
end)
