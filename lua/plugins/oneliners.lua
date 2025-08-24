return {
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },

	{
		"saghen/blink.cmp",
		build = "cargo build --release",
	},
	{
		"danymat/neogen",
		config = true,
		-- Uncomment next line if you want to follow only stable versions
		version = "*",
	},
}
