local map = vim.keymap.set

vim.schedule(function()
    vim.pack.add({
        'https://github.com/nvim-lua/plenary.nvim',
        'https://github.com/nvim-pack/nvim-spectre',
    })
    map('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>')
    map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>')
    map('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>')
    map('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>')
end)
