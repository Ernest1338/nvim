vim.schedule(function()
    vim.pack.add({ 'https://github.com/monkoose/neocodeium' })

    local neocodeium = require("neocodeium")
    neocodeium.setup({
        manual = false
    })
    vim.keymap.set("i", "<M-]>", function() neocodeium.cycle_or_complete(1) end)
    vim.keymap.set("i", "<M-[>", function() neocodeium.cycle_or_complete(-1) end)
    vim.keymap.set("i", "<M-Enter>", neocodeium.accept)

    -- NOTE: need to do `:NeoCodeium auth` before using
end)
