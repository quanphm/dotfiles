return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = "ConformInfo",
	opts = {
		formatters_by_ft = {
			html = { "prettierd" },
			css = { "prettierd" },
			yaml = { "prettierd" },
			json = { "prettierd" },
			lua = { "stylua" },
			rust = { "rustfmt_2018" },
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
			rustfmt_2018 = {
				meta = {
					url = "https://github.com/rust-lang/rustfmt",
					description = "A tool for formatting rust code according to style guidelines.",
				},
				command = "rustfmt",
				args = { "--emit=stdout", "--edition=2018" },
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
			async = true,
		},
		notify_on_error = false,
	},
	config = function(_, opts)
		require("conform").setup(opts)

		local get_formatter_info = require("conform").get_formatter_info
		local filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }

		for i = 1, #filetypes do
			local ft = filetypes[i]
			require("conform").formatters_by_ft[ft] = function(buffnr)
				if get_formatter_info("biome", buffnr).available then
					return { "biome-check", "biome" }
				else
					return { "prettierd" }
				end
			end
		end
	end,
}
