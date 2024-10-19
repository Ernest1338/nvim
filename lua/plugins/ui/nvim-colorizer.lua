local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("NvChad/nvim-colorizer.lua")
    require("colorizer").setup()
end)
