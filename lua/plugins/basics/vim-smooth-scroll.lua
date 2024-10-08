local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("terryma/vim-smooth-scroll")
    vim.cmd([[
        noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>zz
        noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>zz
    ]])
end)
