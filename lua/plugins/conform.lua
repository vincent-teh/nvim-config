return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- Format on save
	cmd = { "ConformInfo" },
	opts = {
		-- Formatters per language
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			sh = { "shfmt" },
		},
		-- Global options
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		-- Optional: manual format command
		vim.api.nvim_create_user_command("Format", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format current buffer" })
	end,
}
