vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		local opts = { noremap = true, silent = true, buffer = 0 }

		-- Go to definition
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Goto definition" }))

		-- Show hover docs
		vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
	end,
})

return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	ft = "python",
	opts = {
		-- Your settings go here
	},
}
