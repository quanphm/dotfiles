return {
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"windwp/nvim-spectre",
		event = "VeryLazy",
		keys = {
			{
				"<leader>sr",
				function()
					require("spectre").open()
				end,
				desc = "Replace in files (Spectre)",
			},
		},
	},
	{ "numToStr/Comment.nvim", opts = {}, event = "VeryLazy" },
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		version = "2.20.8",
		opts = {
			show_end_of_line = true,
		},
	},
	{
		"mbbill/undotree",
		event = "VeryLazy",
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		event = "VeryLazy",
	},
	{
		"christoomey/vim-tmux-navigator",
		event = "VeryLazy",
	},
}
