local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("rachartier/tiny-inline-diagnostic.nvim")
    require("tiny-inline-diagnostic").setup()
end)
