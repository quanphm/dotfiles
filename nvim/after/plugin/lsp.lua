local nmap = function(keys, funcs, desc)
	if desc then
		desc = "LSP: " .. desc
	end
	vim.keymap.set("n", keys, funcs, { desc = desc })
end

nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
nmap("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
nmap("K", vim.lsp.buf.hover, "Hover Documentation")
nmap("<C-s>", vim.lsp.buf.signature_help, "Signature Documentation")
nmap("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic message")
nmap("<leader>e", vim.diagnostic.open_float, "Open floating diagnostic message")
