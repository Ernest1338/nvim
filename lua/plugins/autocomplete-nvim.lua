local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("deathbeam/autocomplete.nvim")
    require("autocomplete.signature").setup()
    require("autocomplete.buffer").setup()
    -- require("autocomplete.cmd").setup()
end)
