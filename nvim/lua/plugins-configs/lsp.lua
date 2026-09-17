local Js = require("utils.js")

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

-- TypeScript: native `tsc` server for TS 7+ workspaces, `ts_ls`
-- (typescript-language-server, needs TS < 7) everywhere else. Enabling both
-- causes duplicate attach plus fallback warnings on either side.
if (Js.ts_major() or 0) >= 7 then
	vim.lsp.config("tsc", { capabilities = capabilities })
	vim.lsp.enable("tsc")
else
	vim.lsp.config("ts_ls", {
		capabilities = capabilities,
		init_options = {
			preferences = {
				importModuleSpecifierEnding = "minimal",
			},
		},
	})
	vim.lsp.enable("ts_ls")
end

vim.lsp.config("tailwindcss", { capabilities = capabilities })
vim.lsp.enable("tailwindcss")

vim.lsp.config("oxlint", {
	capabilities = capabilities,
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		-- nearest oxlint config, else git root, else nearest package.json
		local root = Js.find_upward(fname, { ".oxlintrc.json", ".oxlintrc.jsonc", "oxlint.config.ts" })
			or Js.find_upward(fname, { ".git" })
			or Js.find_upward(fname, { "package.json" })
		if root then
			on_dir(root)
		end
	end,
	cmd = function(dispatchers, config)
		-- Walk upward from root_dir so nested packages still find the hoisted binary.
		local dir = Js.find_upward((config or {}).root_dir or "", { "node_modules/.bin/oxlint" })
		local local_cmd = dir and vim.fs.joinpath(dir, "node_modules", ".bin", "oxlint")
		if local_cmd and vim.fn.executable(local_cmd) == 1 then
			return vim.lsp.rpc.start({ local_cmd, "--lsp" }, dispatchers)
		end
		return vim.lsp.rpc.start({ "oxlint", "--lsp" }, dispatchers)
	end,
	settings = {
		typeAware = true,
	},
})
vim.lsp.enable("oxlint")

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "💥",
			[vim.diagnostic.severity.WARN] = "👀",
			[vim.diagnostic.severity.HINT] = "🪄",
			[vim.diagnostic.severity.INFO] = "📖",
		},
	},
	virtual_text = {
		severity = {
			vim.diagnostic.severity.ERROR,
			vim.diagnostic.severity.WARN,
		},
	},
	severity_sort = true,
})

-- keymaps (single lifecycle point with the config above)
local nmap = function(keys, funcs, desc)
	if desc then
		desc = "LSP: " .. desc
	end
	vim.keymap.set("n", keys, funcs, { desc = desc })
end

nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
nmap("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
nmap("K", vim.lsp.buf.hover, "Hover Documentation")
nmap("<C-s>", vim.lsp.buf.signature_help, "Signature Documentation")
nmap("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic message")
nmap("<leader>e", vim.diagnostic.open_float, "Open floating diagnostic message")
