vim.schedule(function()
    vim.pack.add({ 'https://github.com/Abizrh/beastie.nvim' })
    require("beastie").setup({
        beasties = {
            {
                name = "cat",
                frames = { "🐱", "😺", "😸", "😹", "😼", "😽" }
            },
            {
                name = "dog",
                frames = { "🐶", "🐕", "🦮", "🐕" }
            },
            {
                name = "bird",
                frames = { "🐦", "🐤", "🐧", "🦜" }
            }
        },
        start_at_launch = true,
        animation_speed = 200,
        active_beastie = 1,
    })
end)
