local status_ok, _ = pcall(require, "lspconfig")

if not status_ok then
	return
end

require("cristhianjhl.lsp.lsp-installer")
require("cristhianjhl.lsp.handlers").setup()
