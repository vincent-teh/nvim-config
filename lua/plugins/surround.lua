return {
	"echasnovski/mini.surround",
	event = "VeryLazy",
	config = function()
		require("mini.surround").setup({
			mappings = {
				add = "sa",
				delete = "sd",
				find = "sf",
				find_left = "sF",
				highlight = "sh",
				replace = "sr",
				update_n_lines = "sn",
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "tex", "latex" },
			callback = function()
				vim.b.minisurround_config = {
					custom_surroundings = {
						["$"] = {
							input = { "%$().-()%$" },
							output = { left = "$", right = "$" },
						},
						["e"] = {
							input = { "\\begin{(.-)}" .. string.rep(".", 999) .. "\\end{%1}" },
							output = function()
								local env = vim.fn.input("Environment: ")
								return { left = "\\begin{" .. env .. "}\n", right = "\n\\end{" .. env .. "}" }
							end,
						},
					},
				}
			end,
		})
	end,
}
