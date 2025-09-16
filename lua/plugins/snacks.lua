return {
	{
		"folke/snacks.nvim",
		enabled = false,
		opts = {
			picker = {
				-- global picker options (optional)
				win = { border = "rounded" },
				layout = "vertical", -- or "horizontal", "ivy"
				matcher = {
					frecency = true,
				},
			},
		},
		keys = {
			{
				"<leader><space>",
				function()
					Snacks.picker.files({
						finder = "files",
						format = "file",
						show_empty = true,
						supports_live = true,
						matcher = {
							frecency = true,
						},
					})
				end,
				desc = "Find files (startup dir)",
			},
			-- Live grep
			{
				"<leader>fg",
				function()
					require("snacks").picker.grep({
						cwd = vim.g.startup_cwd or vim.fn.getcwd(),
					})
				end,
				desc = "Live grep (startup dir)",
			},
			-- Buffers
			{
				"<leader>fb",
				function()
					require("snacks").picker.buffers()
				end,
				desc = "Buffers",
			},
			-- Help tags
			{
				"<leader>fh",
				function()
					require("snacks").picker.help()
				end,
				desc = "Help tags",
			},
			-- Current buffer fuzzy search
			{
				"<leader>/",
				function()
					require("snacks").picker.grep_buffer()
				end,
				desc = "Fuzzy find current buffer",
			},
			-- Hidden files
			{
				"<leader>fF",
				function()
					require("snacks").picker.files({
						cwd = vim.g.startup_cwd or vim.fn.getcwd(),
						hidden = true,
					})
				end,
				desc = "Find hidden files (startup dir)",
			},
			-- Live grep hidden files
			{
				"<leader>fG",
				function()
					require("snacks").picker.grep({
						cwd = vim.g.startup_cwd or vim.fn.getcwd(),
						hidden = true,
					})
				end,
				desc = "Live grep hidden files (startup dir)",
			},
			-- Document symbols
			{
				"<leader>fs",
				function()
					require("snacks").picker.lsp_symbols({ scope = "document" })
				end,
				desc = "LSP document symbols",
			},
			-- Workspace symbols
			{
				"<leader>fS",
				function()
					require("snacks").picker.lsp_symbols({ scope = "workspace" })
				end,
				desc = "LSP workspace symbols",
			},
		},
	},
}
