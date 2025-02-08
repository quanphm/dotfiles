require("fzf-lua").setup({
	previewers = {
		builtin = {
			syntax_limit_b = -102400, -- 100KB limit on highlighting files
		},
	},
	winopts = {
		width = 0.6,
		height = 0.8,
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
		rg_glob_fn = function(query, opts)
			local regex, flags = query:match("^(.-)%s%-%-(.*)$")
			return (regex or query), flags
		end,
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
})
