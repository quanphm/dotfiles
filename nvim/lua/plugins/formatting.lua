return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = "ConformInfo",
	opts = {
		formatters_by_ft = {
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			yaml = { "prettierd" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			svelte = { "prettierd" },
			lua = { "stylua" },
			go = { "gofmt" },
			rust = { "rustfmt" },
			haskell = { "fourmolu" },
		},
		formatters = {
			fourmolu = {
				meta = {
					url = "https://hackage.haskell.org/package/fourmolu-0.14.0.0",
					description = "Fourmolu is a formatter for Haskell source code.",
				},
				command = "fourmolu",
				args = { "$FILENAME" },
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		notify_on_error = false,
	},
}
