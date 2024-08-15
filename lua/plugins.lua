--
-- [[ PLUGINS ]] --
--

require("plugins.mini")
require("plugins.termplug")
require("plugins.mini-pickaproject")

require("plugins.luasnip")
require("plugins.nvim-autopairs")
require("plugins.nvim-cmp")
-- require("plugins.nvim-treesitter")
-- require("plugins.cube-timer")
-- require("plugins.nvim-snippets")
-- require("plugins.indentmini")
-- require("plugins.no-neck-pain")
-- require("plugins.dashboard")
-- require("plugins.neogit")
-- require("plugins.telescope")
-- require("plugins.fzf")
-- require("plugins.nvim-tree")
-- require("plugins.mason")
-- require("plugins.coq-nvim")
-- require("plugins.autocomplete-nvim")
-- require("plugins.epo-nvim")
-- require("plugins.undotree")
-- require("plugins.vim-fugitive")
-- require("plugins.vim-smooth-scroll")
-- require("plugins.git-blame")

--
-- [[ LOCAL PLUGIN DEVELOPMENT ]] --
--

local function runtime_add(path) vim.o.runtimepath = vim.o.runtimepath .. "," .. path end

-- runtime_add("~/Repos/termplug.nvim")
-- MiniDeps.later(function() require("termplug").setup() end)
