local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("folke/flash.nvim")
    require("flash").setup()
    local map = vim.keymap.set
    map("n", "<leader>j", function() require("flash").jump() end)
end)
