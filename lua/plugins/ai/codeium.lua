vim.schedule(function()
    vim.pack.add({ 'https://github.com/Exafunction/codeium.vim' })

    vim.g.codeium_disable_bindings = 1
    vim.g.codeium_manual = true

    local map = vim.keymap.set
    map('i', '<M-Bslash>', function() return vim.fn['codeium#Complete']() end, { expr = true, silent = true })
    map('i', '<M-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
    map('i', '<M-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
        { expr = true, silent = true })
    map('i', '<M-Enter>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })

    -- NOTE: need to do `:Codeium Auth` before using
end)
