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
	":lua require'fzf-lua'.lsp_code_actions({ winopts = {relative='cursor',row=1.01, col=0, height=0.2, width=0.4} })<cr>",
	{ desc = "Code Actions" }
)
vim.keymap.set("n", "<leader><leader>", require("fzf-lua").resume, { desc = "FZF Resume" })
