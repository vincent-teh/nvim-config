return {
	"kylechui/nvim-surround",
	version = "*", -- use latest
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			keymaps = {
				normal = "s", -- replace 'ys' with just 's'
				normal_cur = "ss", -- replace 'yss' with 'ss'
				visual = "s", -- replace 'S' with 's' in visual mode
				delete = "ds", -- same as before
				change = "cs", -- same as before
			},
		})
	end,
}
