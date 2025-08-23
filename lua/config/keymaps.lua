vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open Netrw" })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode with jk" })
vim.keymap.set({ "n", "i" }, "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true, desc = "Save file" })

-- Move line down
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", {
	desc = "Move current line down",
	silent = true,
})
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", {
	desc = "Move selected lines down",
	silent = true,
})

-- Move line up
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", {
	desc = "Move current line up",
	silent = true,
})
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", {
	desc = "Move selected lines up",
	silent = true,
})
vim.keymap.set("v", "<C-y>", '"+y', { desc = "Copy to system clipboard" })
