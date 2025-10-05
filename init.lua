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
	"pyright",
	"ts_ls",
	"clangd",
	"html",
	"ruff",
	"dockerls",
	"yamlls",
	"jsonls",
	"bashls",
	"lua_ls",
	"ltex_plus",
	"cmake",
}

vim.lsp.enable(servers)
