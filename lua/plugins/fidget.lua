local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("j-hui/fidget.nvim")
    require("fidget").setup()
end)
