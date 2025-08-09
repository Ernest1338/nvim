--[[

TODO:
- mini terminal

]]
--

local now, later = MiniDeps.now, MiniDeps.later
local map = vim.keymap.set

now(function()
    require("mini.tabline").setup({
        format = function(buf_id, label)
            local suffix = vim.bo[buf_id].modified and '• ' or ' '
            return '▎' .. MiniTabline.default_format(buf_id, label) .. suffix
        end
    })

    --     require("mini.starter").setup({
    --         --         header = [[
    --         --  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
    --         --  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
    --         -- ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
    --         -- ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██
    --         -- ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
    --         -- ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
    --         -- ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
    --         --    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░
    --         --          ░    ░  ░    ░ ░        ░   ░         ░
    --         --                                 ░
    --         --         ]],
    --         header = [[
    -- ██░ ██  ▄▄▄       ▄████▄   ██ ▄█▀   ▄▄▄█████▓ ██░ ██ ▓█████
    -- ▓██░ ██▒▒████▄    ▒██▀ ▀█   ██▄█▒    ▓  ██▒ ▓▒▓██░ ██▒▓█   ▀
    -- ▒██▀▀██░▒██  ▀█▄  ▒▓█    ▄ ▓███▄░    ▒ ▓██░ ▒░▒██▀▀██░▒███
    -- ░▓█ ░██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄    ░ ▓██▓ ░ ░▓█ ░██ ▒▓█  ▄
    -- ░▓█▒░██▓ ▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄     ▒██▒ ░ ░▓█▒░██▓░▒████▒
    --  ▒ ░░▒░▒ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒     ▒ ░░    ▒ ░░▒░▒░░ ▒░ ░
    --  ▒ ░▒░ ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░       ░     ▒ ░▒░ ░ ░ ░  ░
    --  ░  ░░ ░  ░   ▒   ░        ░ ░░ ░      ░       ░  ░░ ░   ░
    --  ░  ░  ░      ░  ░░ ░      ░  ░                ░  ░  ░   ░  ░
    --                   ░
    --          █     █░ ▒█████   ██▀███   ██▓    ▓█████▄
    --         ▓█░ █ ░█░▒██▒  ██▒▓██ ▒ ██▒▓██▒    ▒██▀ ██▌
    --         ▒█░ █ ░█ ▒██░  ██▒▓██ ░▄█ ▒▒██░    ░██   █▌
    --         ░█░ █ ░█ ▒██   ██░▒██▀▀█▄  ▒██░    ░▓█▄   ▌
    --         ░░██▒██▓ ░ ████▓▒░░██▓ ▒██▒░██████▒░▒████▓
    --         ░ ▓░▒ ▒  ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░ ▒░▓  ░ ▒▒▓  ▒
    --           ▒ ░ ░    ░ ▒ ▒░   ░▒ ░ ▒░░ ░ ▒  ░ ░ ▒  ▒
    --           ░   ░  ░ ░ ░ ▒    ░░   ░   ░ ░    ░ ░  ░
    --             ░        ░ ░     ░         ░  ░   ░
    --                                             ░
    --         ]]
    --     })

    local statusline = require("mini.statusline")
    statusline.setup({
        content = {
            -- FIXME: workaround for termplug when process exits
            inactive = statusline.active
        }
    })

    -- require("mini.sessions").setup({
    --     autoread = true,
    --     directory = vim.fn.stdpath("state") .. "/mini-sessions/"
    -- })
end)

later(function()
    require("mini.icons").setup()
    MiniIcons.tweak_lsp_kind("prepend")
    MiniIcons.mock_nvim_web_devicons()

    require("mini.comment").setup({
        mappings = {
            comment_visual = "<leader>/"
        }
    })

    require("mini.jump2d").setup({
        mappings = {
            start_jumping = "<leader>j"
        },
        view = {
            n_steps_ahead = 1
        }
    })

    require("mini.files").setup({
        mappings = {
            go_in_plus = "<CR>"
        },
        options = {
            permanent_delete = false
        },
        windows = {
            preview = false
        }
    })
    map("n", "<C-f>", "<Cmd>lua if not MiniFiles.close() then MiniFiles.open() end<CR>") -- Toggle file tree

    require("mini.move").setup({
        mappings = {
            left = "H",
            right = "L",
            down = "J",
            up = "K"
        }
    })

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
    vim.ui.select = MiniPick.ui_select
    MiniPick.registry.files = function(local_opts)
        local opts = { source = { cwd = local_opts.cwd } }
        local_opts.cwd = nil
        return MiniPick.builtin.files(local_opts, opts)
    end
    MiniPick.registry.filetype = function()
        local items = vim.fn.getcompletion("", "filetype")
        MiniPick.start({
            source = {
                name = "File type",
                items = items,
                choose = function(filetype)
                    if filetype == nil then return end
                    vim.schedule(function() vim.cmd("setfiletype " .. filetype) end)
                end
            }
        })
    end
    MiniPick.registry.project = function()
        local projects = {
            { name = "config_nvim", path = "~/.config/nvim" },
            { name = "black",       path = "~/Repos/black" },
            { name = "notes",       path = "~/Repos/notes" },
        }
        local items = {}
        for _, p in ipairs(projects) do items[#items + 1] = p.name .. string.rep(" ", 40 - #p.name) .. "| " .. p.path end
        MiniPick.ui_select(items, { prompt = "Select a project:" }, function(_, i)
            if i then
                vim.cmd("cd " .. projects[i].path)
                MiniPick.builtin.files()
            end
        end)
    end
    map("n", "<leader>pp", "<cmd> Pick project <CR>")                                                -- Projects
    map("n", "<leader>pe", "<cmd> edit ~/.config/nvim/lua/plugins/basics/mini.lua | /projects <CR>") -- Edit projects file
    map("n", "<leader>fd", "<cmd> Pick grep_live <CR>")                                              -- Search project
    map("n", "<leader>fD", "<cmd> Pick buf_lines scope='current' <CR>")                              -- Search current file
    map("n", "<leader><leader>", "<cmd> Pick files <CR>")                                            -- Find files
    map("n", "<leader>fc", "<cmd> Pick files cwd='~/.config/nvim/' <CR>")                            -- Modify config
    map("n", "<leader>ft", "<cmd> Pick filetype <CR>")                                               -- Change file type
    map("n", "<leader>of", "<cmd> Pick explorer cwd='$HOME' <CR>")                                   -- Open file
    map("n", "<leader>ot", "<cmd> Pick hipatterns scope='all' <CR>")                                 -- Open TODOs and similar
    map("n", "<leader>:", "<cmd> Pick commands <CR>")                                                -- Pick commands
    map("n", "<leader>bb", "<cmd> Pick buffers <CR>")                                                -- Buffers
    map("n", "<leader>co", "<cmd> Pick colorschemes <CR>")                                           -- Choose colorscheme
    map("n", "<leader>nn", "<cmd> cd ~/Repos/notes/ <CR><cmd> Pick files cwd='~/Repos/notes/' <CR>") -- Browse notes
    map("n", "<f2>", "<cmd> Pick keymaps <CR>")                                                      -- Show keymaps
    map("n", "<f3>", "<cmd> Pick help <CR>")                                                         -- Neovim help pages
    map("n", ";", "<cmd> Pick commands <CR>")                                                        -- Quick command

    local hipatterns = require("mini.hipatterns")
    local hi_words = require("mini.extra").gen_highlighter.words
    hipatterns.setup {
        highlighters = {
            fix       = hi_words({ 'FIXME', 'FIX' }, 'MiniHipatternsFix'),
            warning   = hi_words({ 'WARNING', 'HACK' }, 'MiniHipatternsWarning'),
            todo      = hi_words({ 'TODO' }, 'MiniHipatternsTodo'),
            note      = hi_words({ 'NOTE' }, 'MiniHipatternsNote'),
            perf      = hi_words({ 'PERF' }, 'MiniHipatternsPerf'),
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

    -- local snippets = require("mini.snippets")
    -- local gen_loader = snippets.gen_loader
    -- snippets.setup({
    --     snippets = {
    --         gen_loader.from_file('~/.config/nvim/snippets/global.json'),
    --         gen_loader.from_lang(),
    --     },
    --     mappings = {
    --         expand = '<C-e>',
    --         jump_next = '<C-l>',
    --         jump_prev = '<C-h>',
    --         stop = '<C-c>',
    --     },
    -- })
    -- snippets.start_lsp_server()

    local cmp = require("mini.completion")
    cmp.setup({
        window = {
            info = {
                border = 'rounded',
            },
            signature = {
                border = 'rounded',
            }
        },
        lsp_completion = {
            -- source_func = 'omnifunc',
            -- snippet_insert = cmp.default_snippet_insert, -- NOTE: this should be the default
        }
    })
    map('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
    map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })

    require("mini.pairs").setup({
        modes = {
            insert = true,
            command = true,
            -- terminal = true
        }
    })

    require("mini.git").setup()
    map("n", "<leader>ga", "<cmd> Git add . <CR>")
    map("n", "<leader>gc", "<cmd> Git commit <CR>")
    map("n", "<leader>gd", "<cmd> Git diff <CR>")
    map("n", "<leader>gp", "<cmd> Git pull <CR>")
    map("n", "<leader>gP", "<cmd> Git push <CR>")
    map("n", "<leader>gu", "<cmd> Git restore --staged . <CR>")
    map("n", "<leader>gU", "<cmd> Git restore --staged % <CR>")
    map("n", "<leader>gl", "<cmd> Git log --oneline <CR>")
    map("n", "<leader>gL", "<cmd> Git log --oneline --follow -- % <CR>")
    map("n", "<leader>gs", "<cmd> Git status <CR>")
    map("n", "<leader>gS", "<cmd> lua MiniGit.show_at_cursor() <CR>")
    map("n", "<leader>go", "<Cmd> lua MiniDiff.toggle_overlay() <CR>")
    map("n", "<leader>gb", "<Cmd> horiz Git blame -- % <CR>")

    -- `jk` to escape to normal mode from eg insert mode
    -- local map_combo = require('mini.keymap').map_combo
    -- local mode = { 'i', 'c', 'x', 's' }
    -- map_combo(mode, 'jk', '<BS><BS><Esc>')

    vim.notify = require("mini.notify").make_notify()
    -- hl(0, "MiniNotifyNormal", { bg = "NONE", fg = "#525052" })
    -- require("mini.notify").setup({
    --     content = {
    --         format = function(notif) return notif.msg end,
    --     },
    --     window = {
    --         config = {
    --             border = "none",
    --             anchor = "SE",
    --             row = vim.o.lines - 1,
    --         },
    --         winblend = 100,
    --     }
    -- })

    -- local miniclue = require('mini.clue')
    -- miniclue.setup({
    --     triggers = {
    --         -- Leader triggers
    --         { mode = 'n', keys = '<Leader>' },
    --         { mode = 'x', keys = '<Leader>' },
    --
    --         -- Built-in completion
    --         { mode = 'i', keys = '<C-x>' },
    --
    --         -- `g` key
    --         { mode = 'n', keys = 'g' },
    --         { mode = 'x', keys = 'g' },
    --
    --         -- Marks
    --         { mode = 'n', keys = "'" },
    --         { mode = 'n', keys = '`' },
    --         { mode = 'x', keys = "'" },
    --         { mode = 'x', keys = '`' },
    --
    --         -- Registers
    --         { mode = 'n', keys = '"' },
    --         { mode = 'x', keys = '"' },
    --         { mode = 'i', keys = '<C-r>' },
    --         { mode = 'c', keys = '<C-r>' },
    --
    --         -- Window commands
    --         { mode = 'n', keys = '<C-w>' },
    --
    --         -- `z` key
    --         { mode = 'n', keys = 'z' },
    --         { mode = 'x', keys = 'z' },
    --     },
    --
    --     clues = {
    --         -- Enhance this by adding descriptions for <Leader> mapping groups
    --         miniclue.gen_clues.builtin_completion(),
    --         miniclue.gen_clues.g(),
    --         miniclue.gen_clues.marks(),
    --         miniclue.gen_clues.registers(),
    --         miniclue.gen_clues.windows(),
    --         miniclue.gen_clues.z(),
    --     },
    --
    --     window = {
    --         delay = 200,
    --     },
    -- })

    -- require("mini.surround").setup()

    -- require("mini.animate").setup()

    -- require("mini.cursorword").setup({
    --     delay = 500
    -- })

    -- local minimap = require("mini.map")
    -- minimap.setup({
    --     integrations = {
    --         minimap.gen_integration.builtin_search(),
    --         minimap.gen_integration.diff(),
    --         minimap.gen_integration.diagnostic(),
    --     },
    --     symbols = {
    --         encode = minimap.gen_encode_symbols.dot("4x2"),
    --         scroll_line = "┿",
    --         scroll_view = "│",
    --     },
    --     window = {
    --         width = 12,
    --     },
    -- })
    -- -- Show on startup
    -- minimap.toggle()

    -- require("mini.jump").setup()

    -- require("mini.trailspace").setup()

    -- require("mini.visits").setup()

    -- require("mini.align").setup()

    -- local indentscope = require("mini.indentscope")
    -- indentscope.setup({
    --     draw = {
    --         delay = 0,
    --         animation = indentscope.gen_animation.none(),
    --     }
    -- })

    map("n", "<leader>bz", "<cmd> lua require('mini.misc').zoom() <CR>") -- Zoom current buffer

    require("mini.extra").setup()
end)
