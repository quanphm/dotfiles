local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- keymaps (single lifecycle point with the requires above)
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>n", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-n>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<C-m>", function()
	ui.nav_file(2)
end)
