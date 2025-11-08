require("conform").setup({
	formatters_by_ft = {
		-- html = { "prettierd", "prettier", stop_after_first = true },
		-- css = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
		lua = { "stylua" },
		rust = { "rustfmt_custom" },
		sh = { "shellcheck" },
	},
	formatters = {
		rustfmt_custom = {
			meta = {
				url = "https://github.com/rust-lang/rustfmt",
				description = "A tool for formatting rust code according to style guidelines.",
			},
			command = "rustfmt",
			args = { "--emit=stdout", "--edition=2024" },
			cwd = require("conform.util").root_file({
				"rustfmt.toml",
				".rustfmt.toml",
			}),
		},
	},
	notify_on_error = false,
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
	-- If this is set, Conform will run the formatter asynchronously after save.
	-- It will pass the table to conform.format().
	-- This can also be a function that returns the table.
	format_after_save = {
		lsp_format = "fallback",
	},
})

local get_formatter_info = require("conform").get_formatter_info
local filetypes = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"svelte",
	"json",
	"jsonc",
	"astro",
	"css",
	"html",
}

for i = 1, #filetypes do
	local ft = filetypes[i]
	require("conform").formatters_by_ft[ft] = function(buffnr)
		if get_formatter_info("biome", buffnr).available then
			return { "biome-check", "biome" }
		else
			return { "prettierd", "prettier", stop_after_first = true }
		end
	end
end
