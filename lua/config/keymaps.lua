vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open Netrw" })
vim.keymap.set("n", "<leader>e", function()
	if vim.bo.filetype == "netrw" then
		-- Already in Netrw → go back to previous buffer
		local prev_buf = vim.g.prev_buf_for_explorer
		if prev_buf and vim.api.nvim_buf_is_loaded(prev_buf) then
			vim.api.nvim_set_current_buf(prev_buf)
		else
			print("Netrw: no previous buffer to return to")
		end
	else
		-- Not in Netrw → open Netrw and remember current buffer
		vim.g.prev_buf_for_explorer = vim.api.nvim_get_current_buf()
		vim.cmd("Explore")
	end
end, { desc = "Toggle Netrw" })

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
-- vim.keymap.set("v", "<C-y>", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "Y", '"+y', { noremap = true, desc = "Yank to system clipboard" })
vim.keymap.set("x", "Y", function()
	vim.cmd('normal! "+y')
end, { noremap = true, desc = "Yank selection to system clipboard" })

-- buffer deletion was already mapped in which key.
-- vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close current buffer" })

vim.keymap.set("n", "<leader>qq", function()
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
