local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("mbbill/undotree")

    local map = vim.keymap.set
    map("n", "<leader>u", "<cmd> UndotreeToggle <CR><cmd> UndotreeFocus <CR>") -- Toggle tree
end)