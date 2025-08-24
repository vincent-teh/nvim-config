return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ts_ls",
				"clangd",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			local on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				-- Go to references
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				-- Hover documentation
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				-- Signature help
				vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts)
				-- Rename
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				-- Code actions
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			end

			lspconfig.lua_ls.setup({ on_attach = on_attach })
			lspconfig.pyright.setup({ on_attach = on_attach })
			lspconfig.ts_ls.setup({ on_attach = on_attach })
			lspconfig.clangd.setup({ on_attach = on_attach })
		end,
	},
}
