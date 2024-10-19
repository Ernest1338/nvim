-- enable the experimental lua-loader
pcall(function() vim.loader.enable() end)

local path_package = vim.fn.stdpath("data") .. "/site/"

-- Bootstrap mini if not already installed
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.uv.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/echasnovski/mini.nvim', mini_path }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
end

-- disable some builtin plugins
local builtin_plugs = {
    "gzip",
    "man",
    "matchit",
    "matchparen",
    "netrwPlugin",
    "tarPlugin",
    "tohtml",
    "tutor",
    "zipPlugin",
    "shada_plugin",
    "2html_plugin",
    "tutor_mode_plugin",
    "remote_plugins",
    "python3_provider",
    "perl_provider",
    "node_provider",
    "ruby_provider"
}
for i = 1, #builtin_plugs do
    vim.g["loaded_" .. builtin_plugs[i]] = true
end

require("core.configs")
require("core.mappings")

require("mini.deps").setup({ job = { n_threads = 10 }, path = { package = path_package } })
require("plugins")

-- LSP setup (choose either one of those)
MiniDeps.later(function()
    require("lsp.custom-setup")
    -- require("lsp.lspconfig")
end)
