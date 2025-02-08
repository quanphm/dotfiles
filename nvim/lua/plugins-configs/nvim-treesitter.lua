require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"markdown",
		"json",
		"yaml",
		"rust",
		"vim",
		"dockerfile",
		"go",
		"haskell",
	},
	sync_install = false,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	indent = { enable = true },
	autotag = { enable = true },
	context_commentstring = { enable = true, enable_autocmd = false },
	auto_install = true,
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = "<C-s>",
			node_decremental = "<C-bs>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["of"] = "@function.outer",
				["if"] = "@function.inner",
				["oc"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
})
