if vim.fn.argc() > 0 then
	local first_arg = vim.fn.argv(0)
	if vim.fn.isdirectory(first_arg) == 1 then
		vim.cmd("cd " .. first_arg)
	end
end

require("config.options")
require("config.autocommands")
require("config.keymaps")
require("config.lazy")

vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- or "■", "▎", whatever you like
		spacing = 2,
	},
	underline = true, -- underline problematic code
	update_in_insert = false,
	severity_sort = true,
})

local servers = {
	"autotools_ls",
	"bashls",
	"clangd",
	"cmake",
	"dockerls",
	"html",
	"gitlab_ci_ls",
	"jsonls",
	"ltex_plus",
	"lua_ls",
	"pyright",
	"tinymist",
	"ts_ls",
	"yamlls",
}

vim.lsp.enable(servers)
