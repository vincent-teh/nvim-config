return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter.configs")
			ts.setup({
				ensure_installed = { "python", "bash", "vim" },
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true },
				sync_install = false,
			})
		end,
	},
}
