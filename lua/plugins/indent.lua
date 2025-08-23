return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = function()
		local hooks = require("ibl.hooks")

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			-- dim indent
			vim.api.nvim_set_hl(0, "IndentDim", { fg = "#3E4452" }) -- adjust to taste
			-- bright indent (current scope)
			vim.api.nvim_set_hl(0, "IndentBright", { fg = "#EFEFEF", bold = true })
		end)

		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

		return {
			indent = {
				char = "│",
				tab_char = "│",
				highlight = { "IndentDim" }, -- all normal indents
			},
			scope = {
				enabled = true,
				highlight = { "IndentBright" }, -- only current scope
			},
			exclude = {
				filetypes = {
					"Trouble",
					"alpha",
					"dashboard",
					"help",
					"lazy",
					"mason",
					"neo-tree",
					"notify",
					"snacks_dashboard",
					"snacks_notif",
					"snacks_terminal",
					"snacks_win",
					"toggleterm",
					"trouble",
				},
			},
		}
	end,
}

-- return {
-- 	"lukas-reineke/indent-blankline.nvim",
-- 	main = "ibl",
-- 	opts = function()
-- 		local hooks = require("ibl.hooks")
--
-- 		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
-- 			-- dim rainbow
-- 			vim.api.nvim_set_hl(0, "IblRainRedDim", { fg = "#803840" })
-- 			vim.api.nvim_set_hl(0, "IblRainYellowDim", { fg = "#7A653A" })
-- 			vim.api.nvim_set_hl(0, "IblRainBlueDim", { fg = "#315A80" })
-- 			vim.api.nvim_set_hl(0, "IblRainOrangeDim", { fg = "#6A4D33" })
-- 			vim.api.nvim_set_hl(0, "IblRainGreenDim", { fg = "#4C663F" })
-- 			vim.api.nvim_set_hl(0, "IblRainVioletDim", { fg = "#613B70" })
-- 			vim.api.nvim_set_hl(0, "IblRainCyanDim", { fg = "#2C6C6E" })
--
-- 			-- bright rainbow for active scope
-- 			vim.api.nvim_set_hl(0, "IblRainRedBright", { fg = "#E06C75", bold = true })
-- 			vim.api.nvim_set_hl(0, "IblRainYellowBright", { fg = "#E5C07B", bold = true })
-- 			vim.api.nvim_set_hl(0, "IblRainBlueBright", { fg = "#61AFEF", bold = true })
-- 			vim.api.nvim_set_hl(0, "IblRainOrangeBright", { fg = "#D19A66", bold = true })
-- 			vim.api.nvim_set_hl(0, "IblRainGreenBright", { fg = "#98C379", bold = true })
-- 			vim.api.nvim_set_hl(0, "IblRainVioletBright", { fg = "#C678DD", bold = true })
-- 			vim.api.nvim_set_hl(0, "IblRainCyanBright", { fg = "#56B6C2", bold = true })
-- 		end)
--
-- 		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
--
-- 		local rainbow_dim = {
-- 			"IblRainRedDim",
-- 			"IblRainYellowDim",
-- 			"IblRainBlueDim",
-- 			"IblRainOrangeDim",
-- 			"IblRainGreenDim",
-- 			"IblRainVioletDim",
-- 			"IblRainCyanDim",
-- 		}
--
-- 		local rainbow_bright = {
-- 			"IblRainRedBright",
-- 			"IblRainYellowBright",
-- 			"IblRainBlueBright",
-- 			"IblRainOrangeBright",
-- 			"IblRainGreenBright",
-- 			"IblRainVioletBright",
-- 			"IblRainCyanBright",
-- 		}
--
-- 		return {
-- 			indent = {
-- 				char = "│",
-- 				tab_char = "│",
-- 				highlight = rainbow_dim, -- normal indents = dim
-- 			},
-- 			scope = {
-- 				enabled = true,
-- 				highlight = rainbow_bright, -- active scope = bright
-- 			},
-- 			exclude = {
-- 				filetypes = {
-- 					"Trouble",
-- 					"alpha",
-- 					"dashboard",
-- 					"help",
-- 					"lazy",
-- 					"mason",
-- 					"neo-tree",
-- 					"notify",
-- 					"snacks_dashboard",
-- 					"snacks_notif",
-- 					"snacks_terminal",
-- 					"snacks_win",
-- 					"toggleterm",
-- 					"trouble",
-- 				},
-- 			},
-- 		}
-- 	end,
-- }
