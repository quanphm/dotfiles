vim.keymap.set(
	"n",
	"<leader>q",
	"<cmd>TroubleToggle<CR>",
	{ desc = "Trouble: Show diagnostics list", silent = true, noremap = true }
)

vim.keymap.set(
	"n",
	"<leader>xq",
	"<cmd>TroubleToggle quickfix<CR>",
	{ desc = "Trouble: Quick fix", silent = true, noremap = true }
)
