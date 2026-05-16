vim.schedule(function()
    vim.pack.add({ 'https://github.com/L3MON4D3/LuaSnip' })
    -- NOTE: also enable friendly-snippets or vim-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
end)
