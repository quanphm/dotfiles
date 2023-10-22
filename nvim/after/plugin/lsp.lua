vim.keymap.set("n", "ff", function()
  require("conform").format({
    timeout_ms = 1000,
    lsp_fallback = true,
  })
end, { desc = "Format code" })
