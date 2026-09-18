require("fzf-lua").setup({
	previewers = {
		builtin = {
			syntax_limit_b = 1024 * 1024,
		},
		codeaction = {
			diff_opts = { ctxlen = 3 },
		},
		codeaction_native = {
			diff_opts = { ctxlen = 3 },
		},
	},
	winopts = {
		width = 0.6,
		height = 0.8,
		backdrop = 100,
		preview = {
			hidden = false,
			vertical = "up:60%",
			horizontal = "right:50%",
			layout = "vertical",
			flip_columns = 100,
			delay = 0,
			winopts = { number = false },
		},
	},
	grep = {
		rg_glob = true,
		glob_flag = "--iglob",
		glob_separator = "%s%-%-",
	},
	keymap = {
		builtin = {
			true,
			["<C-d>"] = "preview-page-down",
			["<C-u>"] = "preview-page-up",
		},
		fzf = {
			true,
			["ctrl-d"] = "preview-page-down",
			["ctrl-u"] = "preview-page-up",
			["ctrl-q"] = "select-all+accept",
		},
	},
	defaults = {
		git_icons = false,
		file_icons = false,
		color_icons = false,
		formatter = "path.filename_first",
	},
	oldfiles = {
		include_current_session = true,
	},
})

require("fzf-lua").register_ui_select()

-- keymaps (single lifecycle point with setup above)
local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "Search Files" })
vim.keymap.set("n", "<leader>?", "<cmd>FzfLua oldfiles<CR>", { desc = "Find recently opened files" })
vim.keymap.set("n", "<leader><space>", fzf.buffers, { desc = "Find existing buffers" })
vim.keymap.set("n", "<leader>sh", fzf.helptags, { desc = "Search Help" })
vim.keymap.set("n", "<leader>sw", fzf.grep_cword, { desc = "Search current Word" })
vim.keymap.set("n", "<leader>sg", fzf.live_grep, { desc = "Search by Grep" })
vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "Search Keymaps" })
vim.keymap.set("n", "gd", fzf.lsp_definitions, { desc = "Goto Definition" })
vim.keymap.set("n", "gr", fzf.lsp_references, { desc = "Goto References" })
vim.keymap.set("n", "gi", fzf.lsp_implementations, { desc = "Goto Implementation" })
vim.keymap.set(
	"n",
	"<leader>ds",
	":lua require'fzf-lua'.lsp_document_symbols({winopts = {preview={wrap='wrap'}}})<cr>",
	{ desc = "Document Symbols" }
)
vim.keymap.set(
	"n",
	"<leader>cd",
	":lua require'fzf-lua'.diagnostics_document({fzf_opts = { ['--wrap'] = true }})<cr>",
	{ desc = "Document Diagnostics" }
)
vim.keymap.set(
	"n",
	"<leader>ca",
	":lua require'fzf-lua'.lsp_code_actions({ winopts = {relative='cursor',row=1.01, col=0, height=0.16, width=0.3 }, previewer = false })<cr>",
	{ desc = "Code Actions" }
)
vim.keymap.set("n", "<leader>r", require("fzf-lua").resume, { desc = "FZF Resume" })
