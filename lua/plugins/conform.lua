return {
	"stevearc/conform.nvim",
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
			c = { "astyle" },
			cpp = { "astyle" },
			cuda = { "astyle" },
		},
		formatters = {
			astyle = {
				command = "astyle",
				args = { "--style=linux" },
			},
		},
		-- Global options
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "Format file or range",
		},
	},
	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)

		-- Optional: manual format command
		vim.api.nvim_create_user_command("Format", function()
			conform.format({ async = true, lsp_fallback = true })
		end, { desc = "Format current buffer" })
	end,
}
