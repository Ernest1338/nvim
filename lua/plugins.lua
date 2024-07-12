--[[

TODO:
- mini snippets
- mini terminal

]]
--

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local map = vim.keymap.set

now(function() require("mini.tabline").setup() end)

-- now(function() require("mini.starter").setup() end)

now(function()
    local active = require("mini.statusline").active -- workaround for termplug when process exits
    require("mini.statusline").setup({ content = { inactive = active } })
end)

later(function()
    add("Ernest1338/termplug.nvim")
    require("termplug").setup()
    map({ "n", "t" }, "<A-i>", "<cmd> Term <CR>")
end)

later(function() require("mini.icons").setup() end)

later(function()
    require("mini.comment").setup({ mappings = { comment_visual = "<leader>/" } })
end)

later(function()
    require("mini.jump2d").setup({ mappings = { start_jumping = "<leader>j" }, view = { n_steps_ahead = 1 } })
end)

later(function()
    require("mini.files").setup({ mappings = { go_in_plus = "<CR>" }, options = { permanent_delete = false } })
    map("n", "<C-f>", "<Cmd>lua if not MiniFiles.close() then MiniFiles.open() end<CR>") -- Toggle file tree
end)

later(function()
    require("mini.move").setup({ mappings = { left = "H", right = "L", down = "J", up = "K" } })
end)

later(function()
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
end)

later(function()
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
end)

later(function()
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

    add("Ernest1338/mini.pickaproject")
    require("mini.pickaproject").setup()
end)

later(function()
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
end)

later(function()
    require("mini.completion").setup()
    vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
    vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
end)

later(function()
    require("mini.pairs").setup({ modes = { insert = true, command = true, terminal = true } })
end)

later(function()
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
end)

-- Needs to be after every other mini module, I think
later(function() require("mini.extra").setup() end)

-- later(function()
--     add({ source = "nvim-treesitter/nvim-treesitter", hooks = { post_checkout = function() vim.cmd('TSUpdate') end } })
--     require("nvim-treesitter.configs").setup {
--         highlight = { enable = true, },
--         indent = { enable = true },
--     }
-- end)

--
-- [[ LOCAL PLUGIN DEV ]] --
--

local function runtime_add(path) vim.o.runtimepath = vim.o.runtimepath .. "," .. path end

-- runtime_add("~/Repos/termplug.nvim")
-- later(function() require("termplug").setup() end)
