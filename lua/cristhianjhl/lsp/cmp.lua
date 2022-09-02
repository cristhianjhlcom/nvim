local status_ok, cmp_nvm_lsp = pcall(require, "cmp_nvim_lsp")

if not status_ok then
    return
end

local capabilities = cmp_nvm_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local status_ok, cmp = pcall(require, 'cmp')

if not status_ok then
    return
end

cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>']     = cmp.mapping.scroll_docs(-4),
      ['<C-f>']     = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>']     = cmp.mapping.abort(),
      ['<CR>']      = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },           -- For luasnip users.
        -- { name = 'vsnip' },          -- For vsnip users.
        -- { name = 'ultisnips' },      -- For ultisnips users.
        -- { name = 'snippy' },         -- For snippy users.
        }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
})


