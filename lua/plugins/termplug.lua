local add, later = MiniDeps.add, MiniDeps.later
local map = vim.keymap.set

later(function()
    add("Ernest1338/termplug.nvim")
    require("termplug").setup()
    map({ "n", "t" }, "<A-i>", "<cmd> Term (tmux new -d -s nvim && tmux a -t nvim) || (tmux a -t nvim \\; new-window -c '~') <CR>")
end)
