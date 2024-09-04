local add, later = MiniDeps.add, MiniDeps.later
local map = vim.keymap.set

later(function()
    add("akinsho/toggleterm.nvim")
    require("toggleterm").setup()
    map({ "n", "t" }, "<A-i>", "<cmd> ToggleTerm direction=float <CR>")
    map("n", "<leader>gg", "<cmd> TermExec direction=float cmd='lazygit; exit' <CR>")
    map({ "n", "t" }, "<C-g>", "<cmd> TermExec direction=float cmd='lazygit; exit' <CR>")
end)
