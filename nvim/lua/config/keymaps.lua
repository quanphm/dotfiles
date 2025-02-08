local Utils = require("utils")

local keyset = vim.keymap.set

keyset("n", "<leader>pv", function()
	require("oil").open()
end, { desc = "Show directory listing", silent = true })

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
-- keyset("n", "<leader>k", "<cmd>bnext<CR>", { desc = "Next buffer" })
-- keyset("n", "<leader>j", "<cmd>bprev<CR>", { desc = "Previous buffer" })
keyset("n", "<leader>bd", "<cmd>bd!<CR>", { desc = "Delete buffer" })

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

keyset("n", "zR", require("ufo").openAllFolds)
keyset("n", "zM", require("ufo").closeAllFolds)
keyset("n", "zr", require("ufo").openFoldsExceptKinds)
keyset("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
keyset("n", "<leader>K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		-- choose one of coc.nvim and nvim lsp
		vim.fn.CocActionAsync("definitionHover") -- coc.nvim
		vim.lsp.buf.hover()
	end
end)

keyset("n", "nl", "Go", { desc = "New line at the end of file", noremap = true })

-- save undo history
keyset("i", ",", ",<C-g>U")
keyset("i", ".", ".<C-g>U")
keyset("i", "!", "!<C-g>U")
keyset("i", "?", "?<C-g>U")
keyset("i", ";", ";<C-g>U")

-- fzf-lua
local fzf = require("fzf-lua")

-- keyset("n", "<leader>?", "<cmd>FzfLua oldfiles<CR>", { desc = "fzf: Find recently opened files" })
-- keyset("n", "<leader><space>", fzf.buffers, { desc = "fzf: Find existing buffers" })
keyset("n", "<leader>sf", fzf.files, { desc = "fzf: Search Files" })
-- keyset("n", "<leader>sh", fzf.helptags, { desc = "fzf: Search Help" })
-- keyset("n", "<leader>sw", fzf.grep_cword, { desc = "fzf: Search current Word" })
-- keyset("n", "<leader>sg", fzf.live_grep, { desc = "fzf: Search by Grep" })
-- keyset("n", "<leader>sk", fzf.keymaps, { desc = "fzf: Search Keymaps" })
-- keyset("n", "gd", fzf.lsp_definitions, { desc = "Goto Definition" })
-- keyset("n", "gr", fzf.lsp_references, { desc = "Goto References" })
-- keyset("n", "gi", fzf.lsp_implementations, { desc = "Goto Implementation" })
-- keyset("n", "<leader>ds", fzf.lsp_document_symbols, { desc = "Document Symbols" })
-- keyset("n", "<leader>ws", fzf.lsp_dynamic_workspace_symbols, { desc = "Workspace Symbols" })
