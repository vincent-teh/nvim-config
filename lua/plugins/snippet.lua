return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			-- Friendly-snippets
			"rafamadriz/friendly-snippets",
		},
		opts = function()
			local luasnip = require("luasnip")

			-- Load friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			-- Load custom snippets from a user-defined path
			-- Replace with your actual path
			require("luasnip.loaders.from_lua").lazy_load({
				paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
			})

			-- Optional: configure LuaSnip
			luasnip.config.set_config({
				history = true, -- keep around last snippet for jump back
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
			})

			vim.keymap.set({ "i", "s" }, "<C-n>", function()
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				end
			end, { silent = true, desc = "Jump to next LuaSnip field" })

			vim.keymap.set({ "i", "s" }, "<C-N>", function()
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				end
			end, { silent = true, desc = "Jump to previous LuaSnip field" })
			return luasnip
		end,
	},
}
