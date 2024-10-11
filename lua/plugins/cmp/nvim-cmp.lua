local add, later = MiniDeps.add, MiniDeps.later

later(function()
    -- add({
    --     source = "hrsh7th/nvim-cmp",
    --     depends = {
    --         "hrsh7th/cmp-buffer",
    --         "saadparwaiz1/cmp_luasnip",
    --         "hrsh7th/cmp-nvim-lsp",
    --         "hrsh7th/cmp-path",
    --     }
    -- })

    -- NOTE: alternatively use this nvim-cmp fork
    add({
        source = "iguanacucumber/magazine.nvim",
        name = "nvim-cmp",
        depends = {
            "hrsh7th/cmp-buffer",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        }
    })

    local luasnip = require("luasnip")
    local cmp = require("cmp")
    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        sources = {
            { name = "nvim_lsp", keyword_length = 1 },
            { name = "path" },
            { name = "luasnip",  keyword_length = 2 },
            { name = "buffer",   keyword_length = 2 },
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ["<A-;>"] = cmp.mapping(function(fallback)
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<CR>"] = cmp.mapping.confirm({
                select = false
            }),
        }),
        -- Dont ever autoselect options (maybe reconsider autoselecting)
        preselect = cmp.PreselectMode.None,
        formatting = {
            format = function(_, vim_item)
                local kind_icons = {
                    Text = "",
                    Method = "⍟",
                    Function = "∮",
                    Constructor = "",
                    Field = "⍑",
                    Variable = "⭗",
                    Class = "©",
                    Interface = "",
                    Module = "",
                    Property = "℗",
                    Unit = "",
                    Value = "⮈",
                    Enum = "",
                    Keyword = "⌘",
                    Snippet = "",
                    Color = "☀",
                    File = "⛶",
                    Reference = "",
                    Folder = "⛘",
                    EnumMember = "",
                    Constant = "∁",
                    Struct = "",
                    Event = "",
                    Operator = "∑",
                    TypeParameter = "∡"
                }
                vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                return vim_item
            end
        },
        cmp.event:on(
            'confirm_done',
            require("nvim-autopairs.completion.cmp").on_confirm_done()
        )
    })
    -- Lsp hover window border
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = 'rounded' }
    )
    -- Change diagnostic symbols
    vim.cmd([[
    sign define DiagnosticSignError text=✘ texthl=DiagnosticSignError linehl= numhl=
    sign define DiagnosticSignWarn text=» texthl=DiagnosticSignWarn linehl= numhl=
    sign define DiagnosticSignHint text=⚑ texthl=DiagnosticSignHint linehl= numhl=
    sign define DiagnosticSignInfo text=* texthl=DiagnosticSignInfo linehl= numhl=
    ]])
    -- diagnostic popup config
    vim.diagnostic.config({
        -- virtual_text = true,
        -- virtual_lines = true,
        --signs = false,
        float = { border = "rounded" },
    })
end)
