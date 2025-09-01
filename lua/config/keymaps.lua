local map = vim.keymap.set

vim.g.mapleader = " "

map("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode with jk" })
map({ "n", "i" }, "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true, desc = "Save file" })

-- Move line down
map("n", "<A-Down>", ":m .+1<CR>==", {
	desc = "Move current line down",
	silent = true,
})
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", {
	desc = "Move selected lines down",
	silent = true,
})

map("n", "<A-Up>", ":m .-2<CR>==", {
	desc = "Move current line up",
	silent = true,
})
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", {
	desc = "Move selected lines up",
	silent = true,
})

map("n", "<C-c>", '"+y', { noremap = true, desc = "Yank to system clipboard" })
map("x", "<C-c>", '"+y', { noremap = true, desc = "Yank selection to system clipboard" })

map("n", "<leader>qq", function()
	-- Gather unsaved buffers
	local unsaved = {}
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_get_option(buf, "modified") and vim.api.nvim_buf_get_option(buf, "buflisted") then
			table.insert(unsaved, buf)
		end
	end

	-- No unsaved buffers → quit immediately
	if #unsaved == 0 then
		vim.cmd("qa")
		return
	end

	-- Go through each unsaved buffer one by one
	for _, buf in ipairs(unsaved) do
		vim.cmd("buffer " .. buf)

		local name = vim.fn.bufname(buf)
		if name == "" then
			name = "[No Name]"
		end

		print("Current buffer unsaved: [s] Save | [d] Discard | [c] Cancel Quit")

		local key = vim.fn.nr2char(vim.fn.getchar())

		if key == "s" then
			vim.cmd("buffer " .. buf)
			vim.cmd("write")
		elseif key == "d" then
			vim.cmd("bwipeout! " .. buf)
		else
			print("Quit cancelled")
			return
		end
	end

	-- After going through all buffers, quit
	vim.cmd("qa")
end, { desc = "Quit all buffers with per-buffer prompt" })

map("n", "<F3>", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Move between splits
map("n", "<c-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<c-j>", "<C-w>j", { desc = "Move to below split" })
map("n", "<c-k>", "<C-w>k", { desc = "Move to above split" })
map("n", "<c-l>", "<C-w>l", { desc = "Move to right split" })

-- Buffers
map("n", "<leader>bb", "<cmd>b#<CR>", { desc = "Switch to last buffer" })
map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close current buffer" })

-- open float diagnostic
vim.api.nvim_set_keymap(
	"n",
	"<leader>d",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	{ noremap = true, silent = true, desc = "Floating diagnostic" }
)

-- Disable command line history and search history
vim.api.nvim_set_keymap("n", "q", "<nop>", { noremap = true, silent = true })
map("n", "<c-q>", "q", { noremap = true, silent = true, desc = "Macro"})

-- visual block mode
map("n", "gb", "<C-v>", { noremap = true, silent = true, desc = "Visual block mode" })
