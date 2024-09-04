local add, later = MiniDeps.add, MiniDeps.later
local map = vim.keymap.set

later(function()
    add("Ernest1338/mini.pickaproject")
    require("mini.pickaproject").setup({ no_user_commands = true })
    map("n", "<leader>pp", "<cmd> Pick project <CR>")                          -- Projects
    map("n", "<leader>pe", "<cmd> edit ~/.local/share/nvim/projects.txt <CR>") -- Edit projects file
end)
