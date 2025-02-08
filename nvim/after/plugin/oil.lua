vim.keymap.set("n", "<leader>pv", function()
	require("oil").open()
end, { desc = "Show directory listing", silent = true })
