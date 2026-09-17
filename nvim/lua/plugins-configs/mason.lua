require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"html",
		"cssls",
		"tailwindcss",
		"ts_ls", -- fallback for pre-7 workspaces (see Js.ts_major in lsp.lua); TS 7+ uses workspace `tsc`
		"lua_ls",
		"jsonls",
		"bashls",
		"svelte",
	},
	automatic_installation = false,
	handlers = nil,
})
