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
			sh = { "shellcheck" },
		},
		formatters = {
			fourmolu = {
				meta = {
					url = "https://hackage.haskell.org/package/fourmolu",
					description = "Fourmolu is a formatter for Haskell source code.",
				},
				command = "fourmolu",
				args = { "--stdin-input-file", "$FILENAME" },
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
			async = true,
		},
		notify_on_error = false,
	},
}
