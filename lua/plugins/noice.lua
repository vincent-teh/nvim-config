return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
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
	},
}
