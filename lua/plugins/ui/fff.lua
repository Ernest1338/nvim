vim.schedule(function()
    vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
            if not ev.data.active then vim.cmd.packadd('fff.nvim') end
            vim.notify('Building fff.nvim', vim.log.levels.INFO)
            local path = vim.fn.stdpath('data') .. '/site/pack/nvim/opt/fff.nvim'
            local obj = vim.system({ 'cargo', 'build', '--release' }, { cwd = path }):wait()
            if obj.code == 0 then
                vim.notify('Building fff.nvim done', vim.log.levels.INFO)
            else
                vim.notify('Building fff.nvim failed', vim.log.levels.ERROR)
            end
        end
    end })

    vim.pack.add({ 'https://github.com/dmtrKovalenko/fff.nvim' })

    require("fff").setup()
end)
