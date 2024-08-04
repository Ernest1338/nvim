local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("williamboman/mason.nvim")
    require("mason").setup()
end)
