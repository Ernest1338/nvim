local add, later = MiniDeps.add, MiniDeps.later

-- NOTE: use lspconfig or find a way to use `require('lazydev').find_workspace(buf?)` as per lazydev docs

later(function()
    add("folke/lazydev.nvim")
    require("lazydev").setup({
        library = {
            "~/.config/nvim"
        }
    })
end)
