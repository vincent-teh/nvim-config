return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true, -- makes background transparent
			style = "night",
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background = true, -- makes background transparent
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			integrations = {
				notify = true,
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = "catppuccin",
			sections = {
				lualine_c = {
					{
						'filename',
						path = 1
					}
				}
			}
		},
	},
}
