local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("akinsho/bufferline.nvim")
    require("bufferline").setup()
end)
