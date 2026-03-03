return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	keys = {
		{ "<leader>nm", "<cmd>Noice<cr>", desc = "Noice messages" },
		{ "<leader>nl", "<cmd>Noice last<cr>", desc = "Noice last message" },
		{ "<leader>nh", "<cmd>Noice history<cr>", desc = "Noice history" },
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
		notify = {
			enabled = false,
		},
	},
}
