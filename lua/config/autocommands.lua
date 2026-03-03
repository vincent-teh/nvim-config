-- Auto-reload files when changed externally
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	pattern = "*",
	command = "checktime",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
	pattern = "*",
	callback = function()
		vim.notify("File reloaded", vim.log.levels.INFO)
	end,
})

-- LspInfo command
vim.api.nvim_create_user_command("LspInfo", function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	local buf = vim.api.nvim_create_buf(false, true)
	local lines = {}
	
	if #clients == 0 then
		lines = { "No LSP clients attached to this buffer" }
	else
		for _, client in ipairs(clients) do
			table.insert(lines, string.format("Client: %s (id %d)", client.name, client.id))
			table.insert(lines, string.format("  Root dir: %s", client.config.root_dir or "N/A"))
			table.insert(lines, string.format("  Filetypes: %s", table.concat(client.config.filetypes or {}, ", ")))
			table.insert(lines, string.format("  Cmd: %s", table.concat(client.config.cmd or {}, " ")))
			table.insert(lines, string.format("  Autostart: %s", client.config.autostart and "true" or "false"))
			table.insert(lines, "  Capabilities:")
			local caps = client.server_capabilities
			table.insert(lines, string.format("    Formatting: %s", caps.documentFormattingProvider and "✓" or "✗"))
			table.insert(lines, string.format("    Code actions: %s", caps.codeActionProvider and "✓" or "✗"))
			table.insert(lines, string.format("    Completion: %s", caps.completionProvider and "✓" or "✗"))
			table.insert(lines, string.format("    Hover: %s", caps.hoverProvider and "✓" or "✗"))
			table.insert(lines, string.format("    Rename: %s", caps.renameProvider and "✓" or "✗"))
			table.insert(lines, "")
		end
	end
	
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.api.nvim_buf_set_option(buf, "modifiable", false)
	vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
	
	local width = 80
	local height = #lines
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = (vim.o.columns - width) / 2,
		row = (vim.o.lines - height) / 2,
		style = "minimal",
		border = "rounded",
		title = " LSP Info ",
		title_pos = "center",
	})
	vim.api.nvim_buf_set_keymap(buf, "n", "q", ":close<CR>", { noremap = true, silent = true })
end, { desc = "Show LSP client information" })
