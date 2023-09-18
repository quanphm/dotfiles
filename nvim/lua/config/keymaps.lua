local Utils = require("utils")

vim.keymap.set("n", "<leader>pv", function()
	require("oil").open()
end, { desc = "Show directory listing", silent = true })

-- better up/down
vim.keymap.set("n", "j", "v:count ? 'j' : 'gj'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count ? 'k' : 'gk'", { expr = true, silent = true })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- move up/down and center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- escape insert mode
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "escape insert mode and save" })

-- windows
-- vim.keymap.set("n", "<leader>w", "<C-w>w", { desc = "Cycle through windows" })
vim.keymap.set("n", "<leader>w_", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>w|", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wx", ":close<CR>", { desc = "Close current split window" })

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "x", '"_x')
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { noremap = true })
vim.keymap.set("n", "dd", '"_dd')

-- switch buffers
-- vim.keymap.set("n", "<leader>k", "<cmd>bnext<CR>", { desc = "Next buffer" })
-- vim.keymap.set("n", "<leader>j", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete buffer" })

-- quit
vim.keymap.set("n", "<C-q>", "<cmd>q!<CR>", { desc = "Force quit" })

vim.keymap.set({ "n", "x" }, "gw", [[/\<<C-r><C-w>\><CR>]], { desc = "Search word under cursor" })
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under cursor in a file" }
)

vim.keymap.set("n", "q", Utils.close_floats, { desc = "Close all float window" })

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set("n", "<leader>K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		-- choose one of coc.nvim and nvim lsp
		vim.fn.CocActionAsync("definitionHover") -- coc.nvim
		vim.lsp.buf.hover()
	end
end)

vim.keymap.set("n", "nl", "Go", { desc = "New line at the end of file", noremap = true })
