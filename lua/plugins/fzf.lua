local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("ibhagwan/fzf-lua")
    require("fzf-lua").setup()
end)
