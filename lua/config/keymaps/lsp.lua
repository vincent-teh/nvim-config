local map = vim.keymap.set

-- LSP mappings
map("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

-- Open float diagnostic
vim.api.nvim_set_keymap(
	"n",
	"<leader>d",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	{ noremap = true, silent = true, desc = "Floating diagnostic" }
)

-- Toggle inline diagnostics
map("n", "<leader>ld", function()
	vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
end, { desc = "Toggle inline diagnostics" })
