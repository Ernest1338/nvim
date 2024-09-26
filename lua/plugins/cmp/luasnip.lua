local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("L3MON4D3/LuaSnip")
    -- NOTE: also enable friendly-snippets or vim-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
end)
