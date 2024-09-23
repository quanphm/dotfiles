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
