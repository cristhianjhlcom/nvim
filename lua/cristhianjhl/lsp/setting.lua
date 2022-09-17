local status_ok, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_ok then
    print("LSP Installer not ok")
    return
end

local cmp_ok, cmp_nvm_lsp = pcall(require, "cmp_nvim_lsp")

if not cmp_ok then
    return
end

local capabilities = cmp_nvm_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp_installer.setup {}

-- TODO: Native LSP Setup.
-- TODO: Get tsserver -> on PATH.
-- TODO: Tell nvim to use tsserver.
local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0, desc = "Hover Documentation"})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0, desc = "[G]o to [D]efinition"})
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {buffer = 0})
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {buffer = 0})
    vim.keymap.set("n", "<Leader>dl", "<CMD>Telescope diagnostics<CR>", {buffer = 0})
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, {buffer = 0, desc = "[R]e[N]ame"})
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {buffer = 0, desc = "[C]ode [A]ction"})
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

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,
	settings = {
		Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = { library = vim.api.nvim_get_runtime_file('', true) },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false, },
		},
	},
}

require'lspconfig'.jsonls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
	settings = {
        python = {
          analysis = {
            typecheckingmode = "off"
          }
        }
	},
}

require'lspconfig'.cssls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.html.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
