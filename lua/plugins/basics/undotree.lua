vim.schedule(function()
    vim.pack.add({ 'https://github.com/mbbill/undotree' })

    local map = vim.keymap.set
    map("n", "<leader>u", "<cmd> UndotreeToggle <CR><cmd> UndotreeFocus <CR>") -- Toggle tree
end)
