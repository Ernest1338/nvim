-- enable the experimental lua-loader
pcall(function() vim.loader.enable() end)

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

require("plugins")

-- Update command
vim.api.nvim_create_user_command('PackUpdate', function()
  vim.pack.update()
end, {})

-- LSP setup (choose either one of those)
vim.schedule(function()
    require("lsp.custom-setup")
    -- require("lsp.lspconfig")
end)
