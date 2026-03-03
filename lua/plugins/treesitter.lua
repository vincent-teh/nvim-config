return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "python", "bash", "vim" },
			auto_install = true,
			ignore_install = { "latex" },
			highlight = { enable = true, disable = { "csv", "latex" } },
			-- highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
			sync_install = false,
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
