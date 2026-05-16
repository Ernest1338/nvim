vim.schedule(function()
    vim.pack.add({ 'https://github.com/folke/flash.nvim' })
    require("flash").setup()
    local map = vim.keymap.set
    map("n", "<leader>j", function() require("flash").jump() end)
end)
