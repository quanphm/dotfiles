require("fzf-lua").setup({
	previewers = {
		builtin = {
			syntax_limit_b = 1024 * 1024,
		},
		codeaction = {
			diff_opts = { ctxlen = 3 },
		},
		codeaction_native = {
			diff_opts = { ctxlen = 3 },
		},
	},
	winopts = {
		width = 0.6,
		height = 0.8,
		backdrop = 100,
		preview = {
			hidden = false,
			vertical = "up:60%",
			horizontal = "right:50%",
			layout = "vertical",
			flip_columns = 120,
			delay = 10,
			winopts = { number = false },
		},
	},
	grep = {
		rg_glob = true,
		glob_flag = "--iglob",
		glob_separator = "%s%-%-",
	},
	keymap = {
		builtin = {
			true,
			["<C-d>"] = "preview-page-down",
			["<C-u>"] = "preview-page-up",
		},
		fzf = {
			true,
			["ctrl-d"] = "preview-page-down",
			["ctrl-u"] = "preview-page-up",
			["ctrl-q"] = "select-all+accept",
		},
	},
	defaults = {
		git_icons = false,
		file_icons = false,
		color_icons = false,
		formatter = "path.filename_first",
	},
	oldfiles = {
		include_current_session = true,
	},
})

require("fzf-lua").register_ui_select()
