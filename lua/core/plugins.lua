--
-- [[ PLUGINS ]] --
--

-- [[ BASICS ]]
require("plugins.mini")
require("plugins.termplug")
require("plugins.mini-pickaproject")
-- require("plugins.nvim-treesitter")
-- require("plugins.mason")
-- require("plugins.fzf")
-- require("plugins.telescope")
-- require("plugins.nvim-tree")
-- require("plugins.undotree")
-- require("plugins.vim-smooth-scroll")
-- require("plugins.persistence")
-- require("plugins.toggleterm")
-- require("plugins.persisted")

-- [[ CMP ]]
-- require("plugins.luasnip")
-- require("plugins.nvim-autopairs")
-- require("plugins.nvim-cmp")
-- require("plugins.nvim-snippets")
-- require("plugins.epo-nvim")
-- require("plugins.coq-nvim")

-- [[ GIT ]]
-- require("plugins.neogit")
-- require("plugins.vim-fugitive")
-- require("plugins.git-blame")
-- require("plugins.gitsigns")

-- [[ NETWORK ]]
-- require("plugins.kulala")
-- require("plugins.curl")

-- [[ UI ]]
-- require("plugins.trouble")
-- require("plugins.noice")
-- require("plugins.which-key")
-- require("plugins.indentmini")
-- require("plugins.indentline")
-- require("plugins.indent-blankline")
-- require("plugins.neominimap")
-- require("plugins.fidget")
-- require("plugins.lualine")
-- require("plugins.dressing")
-- require("plugins.searchbox")
-- require("plugins.satellite")
-- require("plugins.nvim-scrollview")
-- require("plugins.tiny-inline-diagnostic")

-- [[ COLORSCHEMES ]]
-- require("plugins.onedarkpro")
-- require("plugins.tokyonight")
-- require("plugins.catppuccin")
-- require("plugins.nightfox")
-- require("plugins.everforest")
-- require("plugins.edge")
-- require("plugins.github-nvim-theme")
-- require("plugins.sonokai")
-- require("plugins.onedark")

-- [[ OTHERS ]]
-- require("plugins.cube-timer")
-- require("plugins.dashboard")
-- require("plugins.drop")
-- require("plugins.zen-mode")
-- require("plugins.no-neck-pain")
-- require("plugins.codeium")
-- require("plugins.dap")
-- require("plugins.dadbod")
-- require("plugins.flash")
-- require("plugins.nvim-spectre")
-- require("plugins.encourage")
-- require("plugins.nvim-rip-substitute")

--
-- [[ LOCAL PLUGIN DEVELOPMENT ]] --
--

local function runtime_add(path) vim.o.runtimepath = vim.o.runtimepath .. "," .. path end

-- runtime_add("~/Repos/termplug.nvim")
-- MiniDeps.later(function()
--     require("termplug").setup()
--     vim.keymap.set({ "n", "t" }, "<A-i>", "<cmd> Term <CR>")
-- end)
