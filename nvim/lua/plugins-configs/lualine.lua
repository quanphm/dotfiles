require("lualine").setup({
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
})
