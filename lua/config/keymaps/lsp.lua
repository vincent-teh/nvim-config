local map = vim.keymap.set

-- LSP mappings
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

-- Open float diagnostic
vim.api.nvim_set_keymap(
	"n",
	"<leader>d",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	{ noremap = true, silent = true, desc = "Floating diagnostic" }
)
