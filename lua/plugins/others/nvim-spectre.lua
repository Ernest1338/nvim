local add, later = MiniDeps.add, MiniDeps.later
local map = vim.keymap.set

later(function()
    add({ source = "nvim-pack/nvim-spectre", depends = { "nvim-lua/plenary.nvim" } })
    map('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>')
    map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>')
    map('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>')
    map('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>')
end)
