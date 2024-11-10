local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("rgroli/other.nvim")
    require("other-nvim").setup({
        mappings = {
            "golang",
            "python",
            "react",
            "rust",
        }
    })
end)
