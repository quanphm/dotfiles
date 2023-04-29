return {
	{
		"mcchrish/zenbones.nvim",
		dependencies = {
			"rktjmp/lush.nvim",
		},
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("zenbones")
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
				lualine_x = { "encoding", "fileformat" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},
}
