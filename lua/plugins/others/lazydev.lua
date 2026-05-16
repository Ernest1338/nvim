-- NOTE: use lspconfig or find a way to use `require('lazydev').find_workspace(buf?)` as per lazydev docs

vim.schedule(function()
    vim.pack.add({ 'https://github.com/folke/lazydev.nvim' })
    require("lazydev").setup({
        library = {
            "~/.config/nvim"
        }
    })
end)
