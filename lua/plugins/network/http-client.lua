local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("askfiy/http-client.nvim")
    require("http-client").setup()
end)
