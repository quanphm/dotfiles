local palette = {
	bg = "#09090b",
	fg = "#d4d4d8",
	gray = "#52525b",
	neural = "#71717a",
}

require("kanagawa").setup({
	compile = false,
	undercurl = true,
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false,
	dimInactive = false,
	terminalColors = true,
	colors = {
		theme = {
			dragon = {
				ui = {
					fg = palette.fg,
					fg_dim = palette.fg,
					bg = palette.bg,
					bg_p2 = "#27272a",
					bg_gutter = "none",
				},
				syn = {
					string = palette.neural,
					variable = "none",
					number = palette.fg,
					constant = palette.fg,
					identifier = palette.fg,
					parameter = palette.fg,
					fun = palette.fg,
					type = palette.neural,
					statement = palette.neural,
					keyword = palette.neural,
					operator = palette.neural,
					preproc = palette.neural,
					comment = palette.gray,
					deprecated = palette.gray,
					punct = palette.gray,
					special1 = palette.neural,
					special2 = palette.neural,
					special3 = palette.neural,
				},
			},
		},
	},
	theme = "dragon",
	background = {
		dark = "dragon",
		light = "lotus",
	},
	overrides = function(colors)
		return {}
	end,
})

-- require("kanagawa").load("dragon")
vim.cmd("colorscheme kanagawa")
