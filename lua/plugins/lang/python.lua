return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	ft = "python",
	config = function()
		require("venv-selector").setup()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "python",
			callback = function(ev)
				vim.keymap.set("n", "<localleader>v", "<cmd>VenvSelect<cr>", { buffer = ev.buf, desc = "Select Python venv" })
			end,
		})
	end,
}
