---@brief
---
--- https://github.com/Freed-Wu/autotools-language-server
---
--- `autotools-language-server` can be installed via `pip`:
--- ```sh
--- pip install autotools-language-server
--- ```
---
--- Language server for autoconf, automake and make using tree sitter in python.

-- local util = require 'lspconfig.util'
local function simple_root_pattern(files)
	return function(path)
		return vim.fs.find(files, { upward = true, path = path })[1]
	end
end

local root_files = { "configure.ac", "Makefile", "Makefile.am", "*.mk" }

---@type vim.lsp.Config
return {
	cmd = { "autotools-language-server" },
	filetypes = { "config", "automake", "make" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		on_dir(simple_root_pattern(unpack(root_files))(fname))
	end,
	settings = {
		autotools = {
			diagnostics = {
				duplicates = false, -- disables repeated target warnings
			},
		},
	},
}
