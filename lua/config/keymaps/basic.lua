local map = vim.keymap.set

-- Set leader key
vim.g.mapleader = " "

-- Basic mappings
map("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode with jk" })
map({ "n", "i" }, "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true, desc = "Save file" })
map("n", "<F3>", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Conditional escape: dismiss Noice if active, otherwise normal escape behavior
map("n", "<Esc>", function()
	if require("noice").api.status.message.has() then
		vim.cmd("NoiceDismiss")
	else
		-- Normal escape behavior (clear selection, etc.)
		vim.cmd("noh")
	end
end, { noremap = true, silent = true, desc = "Dismiss Noice or clear highlights" })

-- Disable command line history and search history
vim.api.nvim_set_keymap("n", "q", "<nop>", { noremap = true, silent = true })
map("n", "<c-q>", "q", { noremap = true, silent = true, desc = "Macro" })

-- Visual block mode
map("n", "gb", "<C-v>", { noremap = true, silent = true, desc = "Visual block mode" })

-- Clipboard
map("n", "y", '"+y', { noremap = true, desc = "Yank to system clipboard" })
map("x", "y", '"+y', { noremap = true, desc = "Yank selection to system clipboard" })
