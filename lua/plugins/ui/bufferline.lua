local add, later = MiniDeps.add, MiniDeps.later

-- NOTE: bufferline doesn't work well with some other plugin.
--       either dashboard or trouble

later(function()
    add("akinsho/bufferline.nvim")
    require("bufferline").setup()
end)
