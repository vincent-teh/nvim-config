return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "▎" },
			topdelete = { text = "▎" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		signcolumn = true, -- show in the left gutter
		numhl = false, -- disable number highlighting
		linehl = false, -- disable whole-line highlighting
		word_diff = false, -- disable word diff by default

		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},

		attach_to_untracked = true,
		current_line_blame = false, -- toggle with :Gitsigns toggle_current_line_blame
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 500,
			ignore_whitespace = false,
		},
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000,
		preview_config = {
			border = "rounded",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
		on_attach = function(bufnr)
			local map = vim.keymap.set
			local gs = package.loaded.gitsigns

			map("n", "<leader>gh", gs.preview_hunk, { buffer = bufnr, desc = "Preview Git hunk in floating window" })
			-- map("n", "<leader>gH", gs.preview_hunk, { buffer = bufnr, desc = "Preview Git hunk inline" })

			map("n", "]g", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					require("gitsigns").nav_hunk("next")
				end
			end, { buffer = bufnr, desc = "Next Git hunk" })

			map("n", "[g", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					require("gitsigns").nav_hunk("prev")
				end
			end, { buffer = bufnr, desc = "Previous Git hunk" })

			-- Reset current hunk
			map("n", "<leader>gr", gs.reset_hunk, { buffer = bufnr, desc="[g]it [r]eset current hunk"})
			map("v", "<leader>gr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { buffer = bufnr, desc="[g]it [r]eset current hunk"})
		end,
	},
}
