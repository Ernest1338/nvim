--
-- [[ PLUGINS ]] --
--

-- [[ BASICS ]]
require("plugins.basics.mini")
require("plugins.basics.termplug")
require("plugins.basics.mini-pickaproject")
-- require("plugins.basics.myaiplug")
-- require("plugins.basics.nvim-treesitter")
-- require("plugins.basics.mason")
-- require("plugins.basics.fzf")
-- require("plugins.basics.telescope")
-- require("plugins.basics.nvim-tree")
-- require("plugins.basics.undotree")
-- require("plugins.basics.vim-smooth-scroll")
-- require("plugins.basics.persistence")
-- require("plugins.basics.toggleterm")
-- require("plugins.basics.persisted")

-- [[ CMP ]]
-- require("plugins.cmp.luasnip")
-- require("plugins.cmp.nvim-autopairs")
-- require("plugins.cmp.nvim-cmp")
-- require("plugins.cmp.nvim-snippets")
-- require("plugins.cmp.epo-nvim")
-- require("plugins.cmp.coq-nvim")

-- [[ GIT ]]
-- require("plugins.git.neogit")
-- require("plugins.git.vim-fugitive")
-- require("plugins.git.git-blame")
-- require("plugins.git.gitsigns")
-- require("plugins.git.vim-flog")

-- [[ NETWORK ]]
-- require("plugins.network.kulala")
-- require("plugins.network.curl")
-- require("plugins.network.http-client")

-- [[ UI ]]
-- require("plugins.ui.dashboard")
-- require("plugins.ui.trouble")
-- require("plugins.ui.noice")
-- require("plugins.ui.which-key")
-- require("plugins.ui.indentmini")
-- require("plugins.ui.indentline")
-- require("plugins.ui.indent-blankline")
-- require("plugins.ui.neominimap")
-- require("plugins.ui.fidget")
-- require("plugins.ui.lualine")
-- require("plugins.ui.dressing")
-- require("plugins.ui.searchbox")
-- require("plugins.ui.satellite")
-- require("plugins.ui.nvim-scrollview")
-- require("plugins.ui.tiny-inline-diagnostic")
-- require("plugins.ui.zen-mode")
-- require("plugins.ui.no-neck-pain")
-- require("plugins.ui.drop")
-- require("plugins.ui.diffview")
-- require("plugins.ui.bufferline")
-- require("plugins.ui.barbar")
-- require("plugins.ui.todo-comments")
-- require("plugins.ui.dropbar")

-- [[ COLORSCHEMES ]]
-- require("plugins.colorschemes.onedarkpro")
-- require("plugins.colorschemes.tokyonight")
-- require("plugins.colorschemes.catppuccin")
-- require("plugins.colorschemes.nightfox")
-- require("plugins.colorschemes.everforest")
-- require("plugins.colorschemes.edge")
-- require("plugins.colorschemes.github-nvim-theme")
-- require("plugins.colorschemes.sonokai")
-- require("plugins.colorschemes.onedark")

-- [[ OTHERS ]]
-- require("plugins.others.cube-timer")
-- require("plugins.others.codeium")
-- require("plugins.others.dap")
-- require("plugins.others.dadbod")
-- require("plugins.others.flash")
-- require("plugins.others.nvim-spectre")
-- require("plugins.others.encourage")
-- require("plugins.others.nvim-rip-substitute")
-- require("plugins.others.neocodeium")
-- require("plugins.others.grug-far")
-- require("plugins.others.bookmarks")

--
-- [[ LOCAL PLUGIN DEVELOPMENT ]] --
--

local u = require("core.utils")

-- u.runtime_add("~/Repos/termplug.nvim")
-- MiniDeps.later(function()
--     require("termplug").setup()
--     vim.keymap.set({ "n", "t" }, "<A-i>", "<cmd> Term <CR>")
-- end)

-- u.runtime_add("~/Repos/mini.pickaproject")
-- MiniDeps.later(function()
--     require("mini.pickaproject").setup()
--     vim.keymap.set("n", "<leader>pp", "<cmd> Pick project <CR>")
-- end)
