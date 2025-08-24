return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		defaults = {},
		spec = {
			{
				mode = { "n", "v" },
				{ "<leader>f", group = "file/find" },
				{ "<leader>l", group = "LazyGit" },
				{ "<leader>h", group = "Harpoon" },
				{ "<leader>q", group = "Quit" },
			},
			{
				"<leader>b",
				group = "buffer",
				expand = function()
					return require("which-key.extras").expand.buf()
				end,
			},
			{
				"<leader>w",
				group = "windows",
				proxy = "<c-w>",
				expand = function()
					return require("which-key.extras").expand.win()
				end,
			},
		},
	},
}
