return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-frecency.nvim",
			version = "*",
		},
	},

	-- Use `keys` so this overrides LazyVim's default <leader><space> binding.
	keys = {
		{
			"<leader><space>",
			function()
				require("telescope").extensions.frecency.frecency({
					workspace = "CWD", -- search relative to cwd
				})
			end,
			desc = "Find files (startup dir)",
		},
		{
			"<leader>fg",
			function()
				local cwd = vim.g.startup_cwd or vim.fn.getcwd()
				require("telescope.builtin").live_grep({ cwd = cwd })
			end,
			desc = "Live grep (startup dir)",
		},
		-- keep these as-is if you want
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Telescope buffers",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Telescope help tags",
		},
		{
			"<leader>/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "Fuzzy find current buffer",
		},
		{
			"<leader>fF", -- capital F for find hidden files
			function()
				local cwd = vim.g.startup_cwd or vim.fn.getcwd()
				require("telescope.builtin").find_files({ cwd = cwd, hidden = true })
			end,
			desc = "Find hidden files (startup dir)",
		},
		{
			"<leader>fG", -- capital G for live grep hidden files
			function()
				local cwd = vim.g.startup_cwd or vim.fn.getcwd()
				require("telescope.builtin").live_grep({ cwd = cwd, hidden = true })
			end,
			desc = "Live grep hidden files (startup dir)",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").lsp_document_symbols({
					-- pass the encoding from the first client
					symbols = nil,
					position_encoding = "utf-16", -- most language servers default to utf-16
				})
			end,
			desc = "LSP document symbols",
		},
		{
			"<leader>fS",
			function()
				require("telescope.builtin").lsp_workspace_symbols({
					position_encoding = "utf-16",
				})
			end,
			desc = "LSP workspace symbols",
		},
	},
	--
	-- (optional) your normal telescope setup
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			extensions = {
				frecency = {
					show_scores = true,
					show_unindexed = true,
					ignore_patterns = { "*.git/*", "*/tmp/*" },
					workspaces = {
						conf = vim.fn.stdpath("config"),
						data = vim.fn.stdpath("data"),
						project = "~/projects",
					},
				},
			},
		})

		telescope.load_extension("frecency")
	end,
}
