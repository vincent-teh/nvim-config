return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	keys = {
		{
			"<Esc>",
			function()
				require("noice").cmd("dismiss")
			end,
			desc = "Dismiss noice",
		},
	},
	opts = {
		cmdline = {
			enabled = true, -- enables the floating commandline
		},
		messages = { enabled = true },
		popupmenu = { enabled = true }, -- integrates with dressing
		presets = {
			command_palette = true,
		},

		lsp = {
			progress = {
				enabled = true,
				-- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
				-- See the section on formatting for more details on how to customize.
				--- @type NoiceFormat|string
				format = "lsp_progress",
				--- @type NoiceFormat|string
				format_done = "lsp_progress_done",
				throttle = 1000 / 30, -- frequency to update lsp progress message
				view = "mini",
			},
		},
	},
}
