local add, later = MiniDeps.add, MiniDeps.later

later(function()
    local function build_fff(params)
        vim.notify('Building fff.nvim', vim.log.levels.INFO)
        local obj = vim.system({ 'cargo', 'build', '--release' }, { cwd = params.path }):wait()
        if obj.code == 0 then
            vim.notify('Building fff.nvim done', vim.log.levels.INFO)
        else
            vim.notify('Building fff.nvim failed', vim.log.levels.ERROR)
        end
    end

    add({
        source = "dmtrKovalenko/fff.nvim",
        hooks = {
            post_install = build_fff,
            post_checkout = build_fff,
        },
    })

    require("fff").setup()
end)
