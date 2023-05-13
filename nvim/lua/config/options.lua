vim.g.mapleader = " " -- set leader key
vim.g.maplocalleader = " "
vim.g.icons_enabled = false
vim.g.highlighturl_enabled = true

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.swapfile = false
vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line number
vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.splitright = true -- splitting a new window at the right of the current one
vim.opt.splitbelow = true -- splitting a new window below the current one
vim.opt.hlsearch = false -- highlight search
vim.opt.incsearch = true -- incremental search
vim.opt.ignorecase = true -- case insensitive searching
vim.opt.smartcase = true -- don't ignore case with capitals
vim.opt.tabstop = 2 -- number of space in a tab
vim.opt.shiftwidth = 2 -- number of space inserted for indentation
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.wrap = false -- disable lines wrap
vim.opt.cursorline = true -- highlight the text line of the cursor
vim.opt.guicursor = ""
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- length of time to wait before triggering the plugin
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.scrolloff = 8
vim.opt.mouse = "a"
vim.opt.background = "dark"
vim.opt.splitkeep = "screen"

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.backspace = "indent,eol,start"

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

vim.opt.iskeyword:append("-")

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]])
