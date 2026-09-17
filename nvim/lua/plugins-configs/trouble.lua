require("trouble").setup({
	height = 8,
	fold_open = "v",
	fold_closed = ">",
	indent_lines = false,
	use_diagnostic_signs = false,
})

-- keymaps (single lifecycle point with setup above)
vim.keymap.set(
	"n",
	"<leader>q",
	"<cmd>Trouble diagnostics toggle<cr>",
	{ desc = "Trouble: Show diagnostics list", silent = true, noremap = true }
)

vim.keymap.set(
	"n",
	"<leader>xq",
	"<cmd>Trouble qflist toggle<cr>",
	{ desc = "Trouble: Quick fix", silent = true, noremap = true }
)
