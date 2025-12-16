local map = vim.keymap.set

-- Move between splits
map("n", "<C-h>", "<C-w>h", { noremap = true, desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { noremap = true, desc = "Move to below split" })
map("n", "<C-k>", "<C-w>k", { noremap = true, desc = "Move to above split" })
map("n", "<C-l>", "<C-w>l", { noremap = true, desc = "Move to right split" })

-- Split windows
map("n", "<C-w>\\", "<C-w>v", { noremap = true, desc = "Split window vertically" })
map("n", "<C-w>|", "<C-w>s", { noremap = true, desc = "Split window" })
