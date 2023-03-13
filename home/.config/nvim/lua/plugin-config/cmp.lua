local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function (args)
            -- For `vsnip` users.
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    -- 快捷键
    mapping = require'keybindings'.cmp(cmp),
    -- 来源
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- For vsnip users.
        { name = 'vsnip' },
        -- For luasnip users.
        -- { name = 'luasnip' },
        --For ultisnips users.
        -- { name = 'ultisnips' },
        -- -- For snippy users.
        -- { name = 'snippy' },
    },{
        { name = 'buffer' },
        { name = 'path' }
    }),
})

-- https://github.com/hrsh7th/nvim-cmp/issues/875#issuecomment-1214416687
-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(), -- important!
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(), -- important!
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
