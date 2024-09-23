pcall(require("telescope").load_extension, "fzf")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "Telescope: Find recently opened files" })
vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "Telescope: Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "Telescope: Fuzzily search in current buffer" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope: Search Files" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope: Search Help" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Telescope: Search current Word" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope: Search by Grep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Telescope: Search Diagnostics" })
vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { desc = "Telescope: Search Keymaps" })
