--[[

TODO:
- mini snippets
- mini terminal

]]
--

local now, later = MiniDeps.now, MiniDeps.later
local map = vim.keymap.set

now(function()
    require("mini.tabline").setup()

    -- require("mini.starter").setup()

    local statusline = require("mini.statusline")
    statusline.setup({ content = { inactive = statusline.active } }) -- workaround for termplug when process exits
end)

later(function()
    require("mini.icons").setup()
    MiniIcons.tweak_lsp_kind("prepend")

    require("mini.comment").setup({ mappings = { comment_visual = "<leader>/" } })

    require("mini.jump2d").setup({ mappings = { start_jumping = "<leader>j" }, view = { n_steps_ahead = 1 } })

    require("mini.files").setup({ mappings = { go_in_plus = "<CR>" }, options = { permanent_delete = false } })
    map("n", "<C-f>", "<Cmd>lua if not MiniFiles.close() then MiniFiles.open() end<CR>") -- Toggle file tree

    require("mini.move").setup({ mappings = { left = "H", right = "L", down = "J", up = "K" } })

    require("mini.diff").setup({
        view = {
            style = 'sign',
            signs = {
                add = '┃',
                change = '┃',
                delete = '▁'
            }
        },
        options = {
            wrap_goto = true
        }
    })

    -- require("mini.notify").setup({
    --     content = {
    --         format = function(notif) return notif.msg end,
    --     },
    --     window = {
    --         config = {
    --             border = "none",
    --             anchor = "SE",
    --             row = vim.o.lines - 1
    --         },
    --         winblend = 100,
    --     }
    -- })
    vim.notify = require("mini.notify").make_notify()

    require("mini.pick").setup({
        mappings = {
            move_up = "<C-k>",
            move_down = "<C-j>",
        },
        options = {
            use_cache = true,
        },
        window = {
            config = function()
                local height = math.floor(0.7 * vim.o.lines)
                local width = math.floor(0.7 * vim.o.columns)
                return {
                    anchor = 'NW',
                    height = height,
                    width = width,
                    row = math.floor(0.5 * (vim.o.lines - height)),
                    col = math.floor(0.5 * (vim.o.columns - width)),
                    border = 'rounded',
                }
            end
        }
    })
    MiniPick.registry.files = function(local_opts)
        local opts = { source = { cwd = local_opts.cwd } }
        local_opts.cwd = nil
        return MiniPick.builtin.files(local_opts, opts)
    end
    MiniPick.registry.filetype = function()
        local items = vim.fn.getcompletion("", "filetype")
        local filetype = MiniPick.start({ source = { items = items } })
        if filetype ~= nil then vim.api.nvim_set_option_value('filetype', filetype, {}) end
    end
    MiniPick.registry.colorscheme = function()
        local items = vim.fn.getcompletion("", "color")
        local preview = function(_, item) vim.cmd("colorscheme " .. item) end
        local colorscheme = MiniPick.start({ source = { items = items, preview = preview }, window = { config = { width = 20, col = vim.o.columns } } })
        if colorscheme ~= nil then vim.cmd("colorscheme " .. colorscheme) end
    end

    local hipatterns = require("mini.hipatterns")
    hipatterns.setup {
        highlighters = {
            fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFix' },
            fix       = { pattern = '%f[%w]()FIX()%f[%W]', group = 'MiniHipatternsFix' },
            warning   = { pattern = '%f[%w]()WARNING()%f[%W]', group = 'MiniHipatternsWarning' },
            hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsWarning' },
            todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
            note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
            perf      = { pattern = '%f[%w]()PERF()%f[%W]', group = 'MiniHipatternsPerf' },
            hex_color = hipatterns.gen_highlighter.hex_color(),
        }
    }
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    local hl = vim.api.nvim_set_hl
    hl(0, 'MiniHipatternsFix', { fg = "#ffffff", bg = "#ff5f59", bold = true })
    hl(0, "MiniHipatternsWarning", { fg = normal["bg"], bg = "#e0af68", bold = true })
    hl(0, 'MiniHipatternsTodo', { fg = normal["bg"], bg = "#0db9d7", bold = true })
    hl(0, 'MiniHipatternsNote', { fg = normal["bg"], bg = "#10b981", bold = true })
    hl(0, "MiniHipatternsPerf", { fg = normal["bg"], bg = "#bb9af7", bold = true })

    -- TODO: switch to mini.completion and mini.pairs when either mini.completion update drops or neovim/pull/25541 lands
    -- require("mini.completion").setup()
    -- vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
    -- vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
    --
    -- require("mini.pairs").setup({ modes = { insert = true, command = true, terminal = true } })

    require("mini.git").setup()
    map("n", "<leader>gg", "<cmd> Term lazygit <CR>")
    map({ "n", "t" }, "<C-g>", "<cmd> Term lazygit <CR>")
    map("n", "<leader>ga", "<cmd> Git add . <CR>")
    map("n", "<leader>gc", "<cmd> Git commit <CR>")
    map("n", "<leader>gd", "<cmd> Git diff <CR>")
    map("n", "<leader>gp", "<cmd> Git pull <CR>")
    map("n", "<leader>gP", "<cmd> Git push <CR>")
    map("n", "<leader>gu", "<cmd> Git restore --staged % <CR>")
    map("n", "<leader>gU", "<cmd> Git restore --staged . <CR>")
    map("n", "<leader>gl", "<cmd> Git log --oneline <CR>")
    map("n", "<leader>gL", "<cmd> Git log --oneline --follow -- % <CR>")
    map("n", "<leader>gs", "<cmd> lua MiniGit.show_at_cursor() <CR>")
    map("n", "<leader>gS", "<cmd> Git status <CR>")
    map("n", "<leader>go", "<Cmd> lua MiniDiff.toggle_overlay() <CR>")

    -- require("mini.surround").setup()

    -- require("mini.animate").setup()

    -- require("mini.cursorword").setup({ delay = 500 })

    -- local minimap = require("mini.map")
    -- minimap.setup({
    --     integrations = {
    --         minimap.gen_integration.builtin_search(),
    --         minimap.gen_integration.diff(),
    --         minimap.gen_integration.diagnostic(),
    --     },
    -- })
    -- -- Show on startup
    -- minimap.toggle()

    -- require("mini.jump").setup()

    -- require("mini.trailspace").setup()

    -- require("mini.sessions").setup({ directory = vim.fn.stdpath("state") .. "/mini-sessions/" })

    -- require("mini.visits").setup()

    -- Needs to be after every other mini module, I think
    require("mini.extra").setup()
end)
