require("kanso").setup({
	compile = false,
	undercurl = true,
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = {},
	typeStyle = {},
	disableItalics = false,
	transparent = false,
	dimInactive = false,
	terminalColors = true,
	colors = {
		palette = {},
		theme = { zen = {}, pearl = {}, ink = {}, all = {} },
	},
	overrides = function(colors)
		return {}
	end,
	theme = "zen",
	background = {
		dark = "zen",
		light = "pearl",
	},
})

vim.cmd("colorscheme kanso")
