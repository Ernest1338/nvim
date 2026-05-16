vim.schedule(function()
    vim.pack.add({ 'https://github.com/Nedra1998/nvim-mdlink' })
    require('nvim-mdlink').setup({
        keymap = true,
        cmp = true
    })
end)
