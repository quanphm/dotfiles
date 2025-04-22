local function get_config(name)
	return function()
		require("plugins-configs." .. name)
	end
end

return {
	{
		"stevearc/oil.nvim",
		config = get_config("oil"),
		priority = 1001,
	},

	-- search & syntax highlight
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = get_config("fzf"),
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = get_config("nvim-treesitter"),
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		branch = "master",
		config = get_config("nvim-treesitter-context"),
		event = { "BufReadPre", "BufNewFile" },
	},

	-- auto-complete
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{ -- optional cmp completion source for require statements and module annotations
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},
	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = "rafamadriz/friendly-snippets",
		lazy = false,
		opts = require("plugins-configs.blink"),
	},

	-- utilities
	{
		"kylechui/nvim-surround",
		version = "*",
		config = get_config("nvim-surround"),
		event = "VeryLazy",
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
	{
		"lewis6991/gitsigns.nvim",
		config = get_config("gitsigns"),
		event = "VeryLazy",
	},
	{
		"stevearc/conform.nvim",
		config = get_config("conform"),
		event = { "BufWritePre" },
		cmd = "ConformInfo",
	},
	{ "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" }, event = "VeryLazy" },
	{ "ThePrimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" }, event = "VeryLazy" },
	{ "echasnovski/mini.pairs", version = "*" },
	{ "echasnovski/mini.ai", version = "*" },
	{ "numToStr/Comment.nvim", event = "VeryLazy" },
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ "mbbill/undotree", event = "VeryLazy" },
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "folke/zen-mode.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"echasnovski/mini.icons",
		version = "*",
		opts = { style = "glyph" },
	},
	{
		"nvim-lualine/lualine.nvim",
		config = get_config("lualine"),
		event = "VeryLazy",
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "VeryLazy",
		enabled = true,
		config = true,
	},
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		opts = require("plugins-configs.trouble"),
	},
	{ "folke/snacks.nvim", priority = 1000, lazy = false },

	-- themes
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = get_config("themes"),
	},

	-- lsp
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = get_config("lsp"),
	},
}
