local add, later = MiniDeps.add, MiniDeps.later
local map = vim.keymap.set

later(function()
    add({ source = "VonHeikemen/searchbox.nvim", depends = { "MunifTanjim/nui.nvim" } })
    require("searchbox").setup()
    map("n", "<leader>S", ":SearchBoxIncSearch<CR>")
end)
