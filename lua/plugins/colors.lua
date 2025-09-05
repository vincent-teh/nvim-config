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
		if client:supports_method("textDocument/formatting") then
			table.insert(formatter_names, client.name)
		end
	end

	if #formatter_names == 0 then
		return "No Formatter"
	end

	return " " .. table.concat(formatter_names, ", ")
end

local function recording_status()
	local reg = vim.fn.reg_recording()
	if reg == "" then
		return "" -- not recording
	end
	return "Recording @" .. reg
end

return {
	-- NOTES: lualine diff will flicker when hit reload before saving.
	{
		"folke/tokyonight.nvim",
		enabled = false,
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
			options = {
				theme = function()
					local mocha = require("catppuccin.palettes").get_palette("mocha")

					local colors = {
						black = mocha.base,
						white = mocha.text,
						red = mocha.red,
						green = mocha.green,
						yellow = mocha.yellow,
						blue = mocha.blue,
						magenta = mocha.mauve,
						pink = mocha.pink,
						gray = mocha.overlay0,
						darkgray = mocha.overlay1,
						lightgray = mocha.overlay2,
						inactivegray = mocha.surface0,
						bg_B = mocha.surface1,
						bg_C = mocha.surface0,
					}

					local custom_theme = {
						normal = {
							a = { bg = colors.pink, fg = colors.black, gui = "bold" },
							b = { bg = colors.bg_B, fg = nil },
							c = { bg = colors.bg_C, fg = nil },
						},
						insert = {
							a = { bg = colors.green, fg = colors.black, gui = "bold" },
							b = { bg = colors.bg_B, fg = nil },
							c = { bg = colors.bg_C, fg = nil },
						},
						visual = {
							a = { bg = colors.blue, fg = colors.black, gui = "bold" },
							b = { bg = colors.bg_B, fg = nil },
							c = { bg = colors.bg_C, fg = nil },
						},
						replace = {
							a = { bg = colors.red, fg = colors.black, gui = "bold" },
							b = { bg = colors.bg_B, fg = nil },
							c = { bg = colors.bg_C, fg = nil },
						},
						command = {
							a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
							b = { bg = colors.bg_B, fg = nil },
							c = { bg = colors.bg_C, fg = nil },
						},
						inactive = {
							a = { bg = colors.inactivegray, fg = colors.gray, gui = "bold" },
							b = { bg = colors.inactivegray, fg = colors.gray },
							c = { bg = colors.inactivegray, fg = colors.gray },
						},
					}

					return custom_theme
				end,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode", recording_status },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_x = { lsp_clients, formatters },
				lualine_y = { "diagnostics", "filetype" },
			},
		},
	},
}
