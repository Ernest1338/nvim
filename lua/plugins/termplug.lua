local add, later = MiniDeps.add, MiniDeps.later
local map = vim.keymap.set

later(function()
    add("Ernest1338/termplug.nvim")
    require("termplug").setup()
    map({ "n", "t" }, "<A-i>", "<cmd> Term <CR>")
end)
