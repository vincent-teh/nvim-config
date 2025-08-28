local function lsp_clients()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })
	if next(clients) == nil then
		return "No LSP"
	end

	local client_names = {}
	for _, client in pairs(clients) do
		table.insert(client_names, client.name)
	end
	return " " .. table.concat(client_names, ", ")
end


local function formatters()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  if next(clients) == nil then
    return "No Formatter"
  end

  local formatter_names = {}
  for _, client in pairs(clients) do
    -- You can fine-tune this if some clients are only formatters or if you know their names
    if client.supports_method("textDocument/formatting") then
      table.insert(formatter_names, client.name)
    end
  end

  if #formatter_names == 0 then
    return "No Formatter"
  end

  return " " .. table.concat(formatter_names, ", ")
end


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
						"filename",
						path = 1,
					},
				},
				lualine_x = { lsp_clients, formatters },
				lualine_y = { "filetype" },
			},
		},
	},
}
