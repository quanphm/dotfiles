require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"html",
		"cssls",
		"tailwindcss",
		"ts_ls", -- fallback for pre-7 workspaces; TS 7+ uses workspace `tsc`, no Mason package needed
		"lua_ls",
		"jsonls",
		"bashls",
		"svelte",
	},
	automatic_installation = false,
	handlers = nil,
})
