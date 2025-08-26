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
				"dockerls",
				"jsonls",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			local on_attach = function(client, bufnr)
				vim.keymap.set(
					"n",
					"gd",
					vim.lsp.buf.definition,
					{ noremap = true, silent = true, buffer = bufnr, desc = "Goto Definition" }
				)
				-- Go to references
				vim.keymap.set(
					"n",
					"gr",
					vim.lsp.buf.references,
					{ noremap = true, silent = true, buffer = bufnr, desc = "Goto References" }
				)
				-- Hover documentation
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, buffer = bufnr })
				-- Signature help
				vim.keymap.set(
					"n",
					"<leader>sh",
					vim.lsp.buf.signature_help,
					{ noremap = true, silent = true, buffer = bufnr, desc = "Signature Help" }
				)
				-- Rename
				vim.keymap.set(
					"n",
					"<leader>rn",
					vim.lsp.buf.rename,
					{ noremap = true, silent = true, buffer = bufnr, desc = "Rename variable/function" }
				)
				-- Code actions
				vim.keymap.set(
					"n",
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ noremap = true, silent = true, buffer = bufnr, desc = "Code actions" }
				)
				-- Diagnostics
				vim.keymap.set(
					"n",
					"<leader>d",
					vim.diagnostic.open_float,
					{ noremap = true, silent = true, buffer = bufnr, desc = "Show diagnostic message" }
				)
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Next diagnostic" })
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Previous diagnostic" })
			end

			lspconfig.lua_ls.setup({ on_attach = on_attach })
			lspconfig.pyright.setup({ on_attach = on_attach })
			lspconfig.ts_ls.setup({ on_attach = on_attach })
			lspconfig.clangd.setup({ on_attach = on_attach })
			lspconfig.dockerls.setup({ on_attach = on_attach })
			lspconfig.jsonls.setup({ on_attach = on_attach })
		end,
	},
}
