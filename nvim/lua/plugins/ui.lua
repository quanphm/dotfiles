local palette = {
	bg = "#09090b",
	fg = "#d4d4d8",
	gray = "#52525b",
	neural = "#71717a",
}

return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		opts = {
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
		},
		config = function(_, opts)
			require("kanagawa").setup(opts)
			vim.cmd.colorscheme("kanagawa-dragon")
		end,
	},
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					"diagnostics",
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "VeryLazy",
		enabled = true,
		config = true,
	},
}
