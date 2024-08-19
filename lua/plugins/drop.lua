local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("folke/drop.nvim")
    -- NOTE: some dashboard plugin needs to be enabled
    require("drop").setup()
end)
