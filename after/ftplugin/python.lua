local function kind_matches(item_kind, kind)
	if type(kind) == "table" then
		return vim.tbl_contains(kind, item_kind)
	end
	return item_kind == kind
end

local function jump_to_symbol(direction, kind)
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return
	end
	local params = vim.lsp.util.make_position_params(0, clients[1].offset_encoding)
	vim.lsp.buf_request(0, "textDocument/documentSymbol", params, function(err, result, _, _)
		if err or not result then
			return
		end

		local symbols = {}
		local function extract_symbols(items, parent_range)
			for _, item in ipairs(items) do
				if kind_matches(item.kind, kind) then
					local range = item.range or item.location.range
					table.insert(symbols, { line = range.start.line, range = range })
				end
				if item.children then
					extract_symbols(item.children, item.range)
				end
			end
		end
		extract_symbols(result)

		table.sort(symbols, function(a, b)
			return a.line < b.line
		end)

		local current_line = vim.fn.line(".") - 1
		local target = nil

		if direction == "next" then
			for _, sym in ipairs(symbols) do
				if sym.line > current_line then
					target = sym.line + 1
					break
				end
			end
		else
			for i = #symbols, 1, -1 do
				if symbols[i].line < current_line then
					target = symbols[i].line + 1
					break
				end
			end
		end

		if target then
			vim.cmd("normal! " .. target .. "G")
		end
	end)
end

local function jump_to_symbol_end(direction, kind)
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return
	end
	local params = vim.lsp.util.make_position_params(0, clients[1].offset_encoding)
	vim.lsp.buf_request(0, "textDocument/documentSymbol", params, function(err, result, _, _)
		if err or not result then
			return
		end

		local symbols = {}
		local function extract_symbols(items)
			for _, item in ipairs(items) do
				if kind_matches(item.kind, kind) then
					local range = item.range or item.location.range
					table.insert(symbols, { line = range["end"].line, range = range })
				end
				if item.children then
					extract_symbols(item.children)
				end
			end
		end
		extract_symbols(result)

		table.sort(symbols, function(a, b)
			return a.line < b.line
		end)

		local current_line = vim.fn.line(".") - 1
		local target = nil

		if direction == "next" then
			for _, sym in ipairs(symbols) do
				if sym.line > current_line then
					target = sym.line + 1
					break
				end
			end
		else
			for i = #symbols, 1, -1 do
				if symbols[i].line < current_line then
					target = symbols[i].line + 1
					break
				end
			end
		end

		if target then
			vim.cmd("normal! " .. target .. "G")
		end
	end)
end

vim.api.nvim_create_autocmd("LspAttach", {
	buffer = 0,
	callback = function()
		vim.keymap.set("n", "]]", function()
			jump_to_symbol("next", { 6, 12 })
		end, { buffer = true, desc = "Next method/function" })
		vim.keymap.set("n", "[[", function()
			jump_to_symbol("prev", { 6, 12 })
		end, { buffer = true, desc = "Previous method/function" })
		vim.keymap.set("n", "][", function()
			jump_to_symbol_end("next", { 6, 12 })
		end, { buffer = true, desc = "Next method/function end" })
		vim.keymap.set("n", "[]", function()
			jump_to_symbol_end("prev", { 6, 12 })
		end, { buffer = true, desc = "Previous method/function end" })
		vim.keymap.set("n", "]c", function()
			jump_to_symbol("next", 5)
		end, { buffer = true, desc = "Next class" })
		vim.keymap.set("n", "[c", function()
			jump_to_symbol("prev", 5)
		end, { buffer = true, desc = "Previous class" })
	end,
})
