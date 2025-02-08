require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"html",
		"cssls",
		"ts_ls",
		"lua_ls",
		"jsonls",
		"bashls",
		"svelte",
	},
	automatic_installation = false,
	handlers = nil,
})
