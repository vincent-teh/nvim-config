return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				columns = {
					"icon", -- show file icon next to name
					-- "permissions",
					-- "size",
					-- "mtime",
				},
				view_options = {
					show_hidden = true, -- show dotfiles
				},
				keymaps = {
					["<CR>"] = "actions.select",
					["-"] = "actions.parent",
					["q"] = "actions.close",
				},
			})

			-- Toggle Oil like old Netrw
			vim.keymap.set("n", "<leader>e", function()
				local buf_ft = vim.bo.filetype
				if buf_ft == "oil" then
					local prev_buf = vim.g.prev_buf_for_explorer
					if prev_buf and vim.api.nvim_buf_is_loaded(prev_buf) then
						vim.api.nvim_set_current_buf(prev_buf)
					else
						print("Oil: no previous buffer to return to")
					end
				else
					vim.g.prev_buf_for_explorer = vim.api.nvim_get_current_buf()
					vim.cmd("Oil") -- opens Oil in the current buffer
				end
			end, { desc = "Toggle Oil" })

			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					local dir = vim.fn.isdirectory(vim.fn.expand("<amatch>"))
					local args = vim.v.argv
					local target = args[#args] -- last argument is usually the file/dir opened
					if vim.fn.isdirectory(target) == 1 then
						-- Open Oil in the directory
						vim.cmd("cd " .. target)
						vim.cmd("Oil")
					end
				end,
				pattern = "*",
			})
		end,
	},
}
