local Utils = require("utils")

local keyset = vim.keymap.set

-- keyset up/down
keyset("n", "j", "v:count ? 'j' : 'gj'", { expr = true, silent = true })
keyset("n", "k", "v:count ? 'k' : 'gk'", { expr = true, silent = true })

keyset("v", "J", ":m '>+1<CR>gv=gv")
keyset("v", "K", ":m '<-2<CR>gv=gv")

keyset("n", "H", "^")
keyset("n", "L", "$")

keyset("n", "J", "mzJ`z")

-- move up/down and center cursor
keyset("n", "<C-d>", "<C-d>zz")
keyset("n", "<C-u>", "<C-u>zz")
keyset("n", "n", "nzzzv")
keyset("n", "N", "Nzzzv")

-- escape insert mode
keyset("i", "<C-c>", "<Esc>", { desc = "escape insert mode and save" })

-- windows
keyset("n", "<leader>w_", "<C-w>s", { desc = "Split window horizontally" })
keyset("n", "<leader>w|", "<C-w>v", { desc = "Split window vertically" })
keyset("n", "<leader>wx", ":close<CR>", { desc = "Close current split window" })

keyset({ "n", "v" }, "<leader>y", [["+y]])
keyset("n", "<leader>Y", [["+Y]])

keyset("x", "<leader>p", '"_dP')
keyset("n", "x", '"_x')
keyset({ "n", "v" }, "<leader>d", [["_d]], { noremap = true })
keyset("n", "dd", '"_dd')

-- switch buffers
keyset("n", "<Space>bd", "<cmd>bd!<CR>", { desc = "Delete buffer" })

-- quit
keyset("n", "<C-q>", "<cmd>q!<CR>", { desc = "Force quit" })

keyset({ "n", "x" }, "gw", [[/\<<C-r><C-w>\><CR>]], { desc = "Search word under cursor" })
keyset(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under cursor in a file" }
)

keyset("n", "q", Utils.close_floats, { desc = "Close all float window" })
keyset("n", "nl", "Go", { desc = "New line at the end of file", noremap = true })

-- save undo history
keyset("i", ",", ",<C-g>U")
keyset("i", ".", ".<C-g>U")
keyset("i", "!", "!<C-g>U")
keyset("i", "?", "?<C-g>U")
keyset("i", ";", ";<C-g>U")

-- copy file path/directory to clipboard
keyset("n", "\\cf", ':let @+ = expand("%:p")<CR>', { desc = "Copy file path" })
keyset("n", "\\cd", ':let @+ = expand("%:p:h")<CR>', { desc = "Copy directory path" })
