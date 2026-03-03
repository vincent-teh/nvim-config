return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },
	opts = {
		-- Formatters per language
		formatters_by_ft = {
			c = { "astyle" },
			cpp = { "astyle" },
			cuda = { "astyle" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			javascript = { "prettier" },
			latex = { "latexindent" },
			lua = { "lua_ls" },
			markdown = { "prettier" },
			python = { "black" },
			sh = { "shfmt" },
			tex = { "latexindent" },
			toml = function(bufnr)
				if vim.fn.expand("%:t") == "pyproject.toml" then
					return { "pyproject-fmt" }
				end
				return { "taplo" }
			end,
			typescript = { "prettier" },
			typst = { "typstyle" },
			yaml = { "prettier" },
		},
		formatters = {
			astyle = {
				command = "astyle",
				args = { "--style=linux", "--max-code-length=80" },
			},
			latexindent = {
				prepend_args = function()
					return { "-m", "-l=" .. vim.fn.stdpath("config") .. "/latexindent.yaml" }
				end,
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
