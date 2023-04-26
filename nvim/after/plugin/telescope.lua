pcall(require("telescope").load_extension, "fzf")

vim.keymap.set(
	"n",
	"<leader>?",
	require("telescope.builtin").oldfiles,
	{ desc = "Telescope: Find recently opened files" }
)
vim.keymap.set(
	"n",
	"<leader><space>",
	require("telescope.builtin").buffers,
	{ desc = "Telescope: Find existing buffers" }
)
vim.keymap.set("n", "<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "Telescope: Fuzzily search in current buffer" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "Telescope: Search Files" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "Telescope: Search Help" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "Telescope: Search current Word" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "Telescope: Search by Grep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "Telescope: Search Diagnostics" })
vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { desc = "Telescope: Search Keymaps" })
