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
local function workspace_ts_major()
	local dir = vim.fn.getcwd()
	local prev = nil
	while dir and dir ~= prev do
		local pkg = vim.fs.joinpath(dir, "node_modules", "typescript", "package.json")
		if vim.fn.filereadable(pkg) == 1 then
			local ok, data = pcall(vim.json.decode, table.concat(vim.fn.readfile(pkg), "\n"))
			if ok and type(data) == "table" and type(data.version) == "string" then
				return tonumber(data.version:match("^(%d+)"))
			end
			return nil
		end
		prev = dir
		dir = vim.fs.dirname(dir)
	end
	return nil
end

if (workspace_ts_major() or 0) >= 7 then
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
		-- 1. nearest oxlint config (repo root in this monorepo)
		local found = fname ~= ""
				and vim.fs.find(
					{ ".oxlintrc.json", ".oxlintrc.jsonc", "oxlint.config.ts" },
					{ path = fname, upward = true }
				)[1]
			or nil
		if found then
			on_dir(vim.fs.dirname(found))
			return
		end
		-- 2. git root (nested workspaces without their own config)
		local git = fname ~= "" and vim.fs.find(".git", { path = fname, upward = true })[1] or nil
		if git then
			on_dir(vim.fs.dirname(git))
			return
		end
		-- 3. fallback to nearest package.json
		local pkg = fname ~= "" and vim.fs.find("package.json", { path = fname, upward = true })[1] or nil
		if pkg then
			on_dir(vim.fs.dirname(pkg))
		end
	end,
	cmd = function(dispatchers, config)
		-- Walk upward from root_dir so nested packages still find the hoisted binary.
		local dir = (config or {}).root_dir
		while dir do
			local local_cmd = vim.fs.joinpath(dir, "node_modules", ".bin", "oxlint")
			if vim.fn.executable(local_cmd) == 1 then
				return vim.lsp.rpc.start({ local_cmd, "--lsp" }, dispatchers)
			end
			local parent = vim.fs.dirname(dir)
			if parent == dir then
				break
			end
			dir = parent
		end
		return vim.lsp.rpc.start({ "oxlint", "--lsp" }, dispatchers)
	end,
	settings = {
		typeAware = true,
	},
})
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
