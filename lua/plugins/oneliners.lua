return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local autopairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
			autopairs.setup()

			autopairs.add_rules({
				Rule("$", "$", { "tex", "latex" }):with_move(function(opts)
					return opts.char == "$"
				end),
			})
		end,
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
		enabled = false,
		event = "LspAttach",
		opts = {
			progress = {
				ignore = { "ltex_plus" },
			},
		},
	},
}
