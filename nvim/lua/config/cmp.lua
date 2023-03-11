local cmp = require 'cmp'

cmp.setup({
    preselect = cmp.PreselectMode.None,
    view = {            
        entries = "custom" -- can be "custom", "wildmenu" or "native"
    },
    formatting = {
        format = function(entry, vim_item)
            -- Kind icons
            -- vim_item.kind = string.format('(%s)', vim_item.kind)
            -- Source
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[LUA]",
                buffer = "[BUF]",
                latex_symbols = "[TEX]",
            })[entry.source.name]
            return vim_item
        end
    },
    -- snippet = {
    --     -- REQUIRED - you must specify a snippet engine
    --     expand = function(args)
    --         -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    --         -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --         vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    --         -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    --     end,
    -- },
    mapping = {
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            else
                fallback()
            end
        end,
        ['<C-n>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end,
        ['<C-p>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end,
        ['<Down>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end,
        ['<Up>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end,
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.close(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        -- { name = 'treesitter' },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = 'omni' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('beancount', {
--     sources = cmp.config.sources({
--         {
--             name = 'beancount',
--             option = {
--                 account = '/home/panagiotis/Documents/personal/ledger/ledger.beancount'
--             }
--         },
--         { name = 'omni' },
--         { name = 'path' },
--     }, {
--         { name = 'buffer' },
--     })
-- })

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})
