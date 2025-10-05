return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "VeryLazy" },
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "python", "bash", "vim" },
			auto_install = true,
			highlight = { enable = true, disable = { "csv" } },
			indent = { enable = true },
			autotag = { enable = true },
			sync_install = false,
		},
	},
}
