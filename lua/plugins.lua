--
-- [[ PLUGINS ]] --
--

require("plugins.mini")
require("plugins.termplug")
require("plugins.mini-pickaproject")
-- require("plugins.nvim-treesitter")

--
-- [[ LOCAL PLUGIN DEVELOPMENT ]] --
--

local function runtime_add(path) vim.o.runtimepath = vim.o.runtimepath .. "," .. path end

-- runtime_add("~/Repos/termplug.nvim")
-- later(function() require("termplug").setup() end)
