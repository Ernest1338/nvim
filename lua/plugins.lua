--
-- [[ PLUGINS ]] --
--

require("plugins.mini")
require("plugins.termplug")
require("plugins.mini-pickaproject")
-- require("plugins.nvim-treesitter")
-- require("plugins.cube-timer")

--
-- [[ LOCAL PLUGIN DEVELOPMENT ]] --
--

local function runtime_add(path) vim.o.runtimepath = vim.o.runtimepath .. "," .. path end

-- runtime_add("~/Repos/termplug.nvim")
-- MiniDeps.later(function() require("termplug").setup() end)
