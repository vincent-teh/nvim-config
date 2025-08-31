return {
	{
		"stevearc/oil.nvim",
		enabled = false,
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
					["gd"] = function()
						require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
					end,
					["<leader>ff"] = {
						function()
							require("telescope.builtin").find_files({
								cwd = require("oil").get_current_dir(),
							})
						end,
						mode = "n",
						nowait = true,
						desc = "Find files in the current directory",
					},
					["<C-s>"] = function()
						vim.cmd.write()
					end,
					["<C-h>"] = "<cmd>TmuxNavigateLeft<cr>",
					["<C-j>"] = "<cmd>TmuxNavigateDown<cr>",
					["<C-k>"] = "<cmd>TmuxNavigateUp<cr>",
					["<C-l>"] = "<cmd>TmuxNavigateRight<cr>",
					["<C-\\>"] = "<cmd>TmuxNavigatePrevious<cr>",
				},
				-- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
				skip_confirm_for_simple_edits = false,
				-- Selecting a new/moved/renamed file or directory will prompt you to save changes first
				-- (:help prompt_save_on_select_new_entry)
				prompt_save_on_select_new_entry = true,
				preview_win = {
					-- Whether the preview window is automatically updated when the cursor is moved
					update_on_cursor_moved = true,
					-- How to open the preview window "load"|"scratch"|"fast_scratch"
					preview_method = "fast_scratch",
					-- A function that returns true to disable preview on a file e.g. to avoid lag
					disable_preview = function(filename)
						return false
					end,
					-- Window-local options to use for preview window buffers
					win_options = {},
				},
			})

			-- Toggle Oil like old Netrw
			vim.keymap.set("n", "<leader>e", function()
				local buf_ft = vim.bo.filetype
				if buf_ft == "oil" then
					-- Use vim.cmd.close() instead of buffer switching for cleaner behavior
					vim.cmd.close()
				else
					-- Store current buffer for potential return
					vim.g.prev_buf_for_explorer = vim.api.nvim_get_current_buf()
					vim.cmd("Oil") -- opens Oil in the current buffer
				end
			end, { desc = "Toggle Oil" })

			-- Auto-open Oil when starting nvim with a directory
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					-- Check if we started with no arguments and no files
					if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
						return
					end

					-- Get the first argument passed to nvim
					local target = vim.fn.argv(0)
					if target == "" then
						return
					end

					local fullpath = vim.fn.fnamemodify(target, ":p") -- expand to absolute path
					if vim.fn.isdirectory(fullpath) == 1 then
						-- Don't change directory, just open Oil with the target directory
						vim.cmd("Oil " .. vim.fn.fnameescape(fullpath))
					end
				end,
			})
		end,
	},
}
