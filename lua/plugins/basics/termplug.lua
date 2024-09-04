local add, later = MiniDeps.add, MiniDeps.later
local map = vim.keymap.set

later(function()
    add("Ernest1338/termplug.nvim")
    require("termplug").setup()
    map({ "n", "t" }, "<A-i>", "<cmd> Term <CR>")
    map("n", "<leader>gg", "<cmd> Term lazygit <CR>")
    map({ "n", "t" }, "<C-g>", "<cmd> Term lazygit <CR>")
end)
