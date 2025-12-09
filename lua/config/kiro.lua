local M = {}

local function get_kiro_pane()
	local handle = io.popen('tmux list-panes -F "#{pane_id} #{pane_current_command}"')
	if not handle then
		return nil
	end

	local result = handle:read("*a")
	handle:close()

	for line in result:gmatch("[^\r\n]+") do
		if line:match("kiro%-cli") then
			return line:match("^(%S+)")
		end
	end
	return nil
end

local function send_to_kiro(text)
	local pane = get_kiro_pane()
	if not pane then
		vim.notify("No kiro-cli pane found", vim.log.levels.ERROR)
		return
	end

	-- Escape text and send
	local escaped = text:gsub("'", "'\\''")
	os.execute(string.format("tmux send-keys -t %s -l '%s'", pane, escaped))
	os.execute(string.format("tmux send-keys -t %s Enter", pane))
end

function M.send_selection()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)
	local text = table.concat(lines, "\n")
	local ft = vim.bo.filetype

	vim.ui.input({ prompt = "Ask Kiro about selection: " }, function(input)
		if input and input ~= "" then
			local prompt = string.format("%s\n\n```%s\n%s\n```", input, ft, text)
			send_to_kiro(prompt)
		else
			local prompt = string.format("```%s\n%s\n```", ft, text)
			send_to_kiro(prompt)
		end
	end)
end

function M.send_buffer()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local text = table.concat(lines, "\n")
	local ft = vim.bo.filetype

	vim.ui.input({ prompt = "Ask Kiro about buffer: " }, function(input)
		if input and input ~= "" then
			local prompt = string.format("%s\n\n```%s\n%s\n```", input, ft, text)
			send_to_kiro(prompt)
		else
			local prompt = string.format("```%s\n%s\n```", ft, text)
			send_to_kiro(prompt)
		end
	end)
end

function M.ask(prompt)
	send_to_kiro(prompt)
end

function M.fix_lsp_error()
	local line = vim.fn.line(".")
	local diagnostics = vim.diagnostic.get(0, { lnum = line - 1 })

	if #diagnostics == 0 then
		vim.notify("No diagnostics on current line", vim.log.levels.WARN)
		return
	end

	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local text = table.concat(lines, "\n")
	local ft = vim.bo.filetype
	local filename = vim.fn.expand("%:t")

	local errors = {}
	for _, diag in ipairs(diagnostics) do
		table.insert(errors, string.format("- %s: %s", diag.source or "LSP", diag.message))
	end

	local error_context = string.format("Fix this error in %s:\n\n%s", filename, table.concat(errors, "\n"))

	vim.ui.input({ prompt = "Additional instructions (optional): " }, function(input)
		local prompt
		if input and input ~= "" then
			prompt = string.format("%s\n\n%s\n\n```%s\n%s\n```", error_context, input, ft, text)
		else
			prompt = string.format("%s\n\n```%s\n%s\n```", error_context, ft, text)
		end
		send_to_kiro(prompt)
	end)
end

return M
