local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("kyazdani42/nvim-tree.lua")
    require("nvim-tree").setup()
end)
