vim.schedule(function()
    vim.pack.add({
        'https://github.com/jbyuki/instant.nvim',
        'https://github.com/azratul/live-share.nvim',
    })
    require("live-share").setup({
        port_internal = 8765,
        max_attempts = 40, -- 10 seconds
        service = "serveo.net"
    })
end)
