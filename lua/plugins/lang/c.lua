local map = vim.keymap.set

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "cuda" },
	callback = function()
		-- Go to definition (normal LSP behavior)
		map("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Goto definition" })

		-- Switch between header <-> source using clangd
		-- map(
		-- 	"n",
		-- 	"gs",
		-- 	":ClangdSwitchSourceHeader<CR>",
		-- 	{ noremap = true, silent = true, buffer = 0, desc = "Switch between source/header file" }
		-- )
		map("n", "gs", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Go to declaration" })
	end,
})

return {}
