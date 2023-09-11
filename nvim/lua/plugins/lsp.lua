return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
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
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspStart", "LspInstall" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim" },
			{ "folke/neodev.nvim" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(_, bufnr)
				local nmap = function(keys, funcs, desc)
					if desc then
						desc = "LSP: " .. desc
					end
					vim.keymap.set("n", keys, funcs, { buffer = bufnr, desc = desc })
				end

				nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
				nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
				nmap("gd", function()
					vim.lsp.buf.definition({ reuse_win = true })
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
			end)

			require("neodev").setup({})
			local lspconfig = require("lspconfig")

			require("mason-lspconfig").setup({
				ensure_installed = {
					"html",
					"cssls",
					"tailwindcss",
					"tsserver",
					"lua_ls",
					"jsonls",
					"rust_analyzer",
					"gopls",
					"svelte",
				},
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
					end,
					jsonls = function()
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
					end,
				},
			})

			lsp_zero.set_sign_icons({
				error = "", -- xf659
				warn = "", -- xf529
				hint = "", -- xf835
				info = "", -- xf7fc
			})

			lsp_zero.format_on_save({
				format_opts = {
					timeout_ms = 10000,
				},
				servers = {
					["rust_analyzer"] = { "rust" },
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
						"svelte",
					},
				},
			})

			require("ufo").setup()
			lsp_zero.set_server_config({
				capabilities = {
					textDocument = {
						foldingRange = {
							dynamicRegistration = false,
							lineFoldingOnly = true,
						},
					},
				},
			})

			vim.diagnostic.config({
				virtual_text = false,
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"jay-babu/mason-null-ls.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.gofmt,
					null_ls.builtins.diagnostics.eslint_d,
				},
			})
			require("mason-null-ls").setup({
				ensure_installed = {},
				automatic_installation = true,
				automatic_setup = false,
			})
		end,
	},
}
