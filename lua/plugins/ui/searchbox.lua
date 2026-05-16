local map = vim.keymap.set

vim.schedule(function()
    vim.pack.add({
        'https://github.com/MunifTanjim/nui.nvim',
        'https://github.com/VonHeikemen/searchbox.nvim',
    })
    require("searchbox").setup()
    map("n", "<leader>S", ":SearchBoxIncSearch<CR>")
end)
