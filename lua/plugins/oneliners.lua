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
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
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
