local map = vim.keymap.set

-- Buffer management
map("n", "<leader>bb", "<cmd>b#<CR>", { desc = "Switch to last buffer" })
map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close current buffer" })

-- Quit all buffers with per-buffer prompt
map("n", "<leader>qq", function()
	-- Gather unsaved buffers
	local unsaved = {}
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if
			vim.api.nvim_get_option_value("modified", { buf = buf })
			and vim.api.nvim_get_option_value("buflisted", { buf = buf })
		then
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
