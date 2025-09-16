return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"saghen/blink.cmp",
		build = "cargo build --release",
	},
	{
		"danymat/neogen",
		config = true,
		cmd = { "Neogen", "Neogen function" },
		-- Uncomment next line if you want to follow only stable versions
		version = "*",
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		ft = { "markdown" },
		config = function()
			require("render-markdown").setup({
				win_options = { conceallevel = { rendered = 0 } },
				completions = { lsp = { enabled = true }, blink = { enabled = true } },
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		-- cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			notification = {
				window = {
					winblend = 0,
				},
			},
		},
		tag = "legacy",
	},
}
