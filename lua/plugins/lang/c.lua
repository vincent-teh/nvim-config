vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function()
		-- Go to definition (normal LSP behavior)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Goto definition" })

		-- Switch between header <-> source using clangd
		vim.keymap.set(
			"n",
			"gs",
			":ClangdSwitchSourceHeader<CR>",
			{ noremap = true, silent = true, buffer = 0, desc = "Switch between source/header file" }
		)
	end,
})

return {}
