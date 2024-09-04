local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add("ms-jpq/coq_nvim")
    add("ms-jpq/coq.artifacts")
    vim.g.coq_settings = {
        auto_start = true,
    }
end)
