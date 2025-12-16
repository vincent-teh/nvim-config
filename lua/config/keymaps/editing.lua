local map = vim.keymap.set

-- Move line down
map("n", "<A-Down>", ":m .+1<CR>==", {
	desc = "Move current line down",
	silent = true,
})
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", {
	desc = "Move selected lines down",
	silent = true,
})

-- Move line up
map("n", "<A-Up>", ":m .-2<CR>==", {
	desc = "Move current line up",
	silent = true,
})
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", {
	desc = "Move selected lines up",
	silent = true,
})
