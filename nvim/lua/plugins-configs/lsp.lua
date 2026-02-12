local capabilities = require("blink.cmp").get_lsp_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

vim.lsp.config("lua_ls", { capabilities = capabilities })
vim.lsp.enable("lua_ls")

vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {},
	},
})
vim.lsp.enable("rust_analyzer")

vim.lsp.config("jsonls", {
	capabilities = capabilities,
	settings = {
		json = {
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
				{
					fileMatch = { "tsconfig.json", "tsconfig.*.json" },
					url = "http://json.schemastore.org/tsconfig",
				},
				{
					fileMatch = { "turbo.json" },
					url = "https://turbo.build/schema.json",
				},
				{
					fileMatch = { "biome.json" },
					url = "https://biomejs.dev/schemas/1.5.3/schema.json",
				},
			},
		},
	},
})
vim.lsp.enable("jsonls")

vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	init_options = {
		preferences = {
			importModuleSpecifierEnding = "minimal",
		},
	},
})
vim.lsp.enable("ts_ls")

vim.lsp.config("tailwindcss", { capabilities = capabilities })
vim.lsp.enable("tailwindcss")

vim.lsp.config("oxlint", { capabilities = capabilities })
vim.lsp.enable("oxlint")

vim.diagnostic.config({
	virtual_text = {
		severity = {
			vim.diagnostic.severity.ERROR,
			vim.diagnostic.severity.WARN,
		},
	},
	severity_sort = true,
})

require("ufo").setup()

local signs = {
	-- Error = "󰅚 ",
	-- Warn = "󰳦 ",
	-- Hint = "󱡄 ",
	-- Info = " ",
	Error = "💥",
	Warn = "👀",
	Hint = "🪄",
	Info = "📖",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = nil })
end
