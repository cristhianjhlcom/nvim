-- TODO: Native LSP Setup.
-- TODO: Get tsserver -> on PATH.
-- TODO: Tell nvim to use tsserver.
local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
    vim.keymap.set("n", "<Leader>dk", vim.diagnostic.goto_next, {buffer = 0})
    vim.keymap.set("n", "<Leader>dj", vim.diagnostic.goto_prev, {buffer = 0})
    vim.keymap.set("n", "<Leader>dl", "<CMD>Telescope diagnostics<CR>", {buffer = 0})
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, {buffer = 0})
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {buffer = 0})
end

require'lspconfig'.tsserver.setup{ 
    capabilities = capabilities,
    on_attach = on_attach,
} -- Connect to the server.

require'lspconfig'.intelephense.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        intelephense = {
            stubs = {
                "bcmath",
                "bz2",
                "calendar",
                "Core",
                "curl",
                "zip",
                "zlib",
                "wordpress",
                "woocommerce",
                "acf-pro",
                "wordpress-globals",
                "wp-cli",
                "genesis",
                "polylang"
            },
            files = {
                includePaths = '~/AppData/Roaming/Composer/vendor/php-stubs/'
            },
            files = {
                maxSize = 500000
            }
        }
    }
}

require'lspconfig'.cssls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.html.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
