return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		lazy = true,
		config = function()
			local lsp = require("lsp-zero")

			lsp.preset("minimal")
			lsp.ensure_installed({
				"html",
				"cssls",
				"tailwindcss",
				"tsserver",
				"lua_ls",
				"jsonls",
				"rust_analyzer",
				"gopls",
				"svelte",
			})
			lsp.set_sign_icons({
				error = "", -- xf659
				warn = "", -- xf529
				hint = "", -- xf835
				info = "", -- xf7fc
			})
			lsp.format_on_save({
				format_opts = {
					timeout_ms = 10000,
				},
				servers = {
					["null-ls"] = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"html",
						"css",
						"lua",
						"yaml",
						"json",
						"jsonc",
						"go",
						"rust",
						"svelte",
					},
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "onsails/lspkind.nvim" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
					["<C-e>"] = cmp.mapping.abort(),
				}),
				sources = {
					{ name = "nvim_lsp", priority = 1000 },
					{ name = "luasnip", priority = 750 },
					{ name = "buffer", priority = 500 },
					{ name = "path", priority = 250 },
					{ name = "nvim_lsp_signature_help" },
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
					side_padding = 1,
				},
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = require("lspkind").cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"williamboman/mason.nvim",
				build = ":MasonUpdate",
			},
			{ "williamboman/mason-lspconfig.nvim" },
			{ "folke/neodev.nvim" },
		},
		config = function()
			require("neodev").setup({})
			local lsp = require("lsp-zero")

			local function on_list(options)
				vim.fn.setqflist({}, " ", options)
				vim.api.nvim_command("cfirst")
			end

			lsp.on_attach(function(_, bufnr)
				local nmap = function(keys, funcs, desc)
					if desc then
						desc = "LSP: " .. desc
					end
					vim.keymap.set("n", keys, funcs, { buffer = bufnr, desc = desc })
				end

				nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
				nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
				nmap("gd", function()
					vim.lsp.buf.definition({ reuse_win = true, on_list = on_list })
				end, "Goto Definition")
				nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
				nmap("gr", require("telescope.builtin").lsp_references, "Goto References")
				nmap("ii", vim.lsp.buf.implementation, "Goto Implementation")
				nmap("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
				nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
				nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-s>", vim.lsp.buf.signature_help, "Signature Documentation")
				nmap("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
				nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic message")
				nmap("<leader>e", vim.diagnostic.open_float, "Open floating diagnostic message")

				-- workspace
				-- nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "Workspace Add Folder")
				-- nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace Remove Folder")
				-- nmap("<leader>wl", function()
				-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				-- end, "Workspace List Folders")
			end)

			require("ufo").setup()
			lsp.set_server_config({
				capabilities = {
					textDocument = {
						foldingRange = {
							dynamicRegistration = false,
							lineFoldingOnly = true,
						},
					},
				},
			})

			local status, lspconfig = pcall(require, "lspconfig")
			if not status then
				return
			end

			lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
			lspconfig.jsonls.setup({
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
						},
					},
				},
			})

			lsp.setup()

			vim.diagnostic.config({
				virtual_text = false,
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.rustfmt,
					null_ls.builtins.formatting.gofmt,
					null_ls.builtins.diagnostics.eslint_d,
				},
			})

			require("mason-null-ls").setup({
				ensure_installed = nil,
				automatic_installation = true,
				automatic_setup = false,
			})
		end,
	},
}
