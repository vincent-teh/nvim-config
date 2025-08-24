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
		},
	},
}
