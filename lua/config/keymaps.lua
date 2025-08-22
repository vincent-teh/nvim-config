vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open Netrw" })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode with jk" })
vim.keymap.set({ "n", "i" }, "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true, desc = "Save file" })
