local map = vim.keymap.set

-- Kiro integration
local kiro = require("config.kiro")
map("v", "<leader>ks", kiro.send_selection, { desc = "Send selection to Kiro" })
map("n", "<leader>kb", kiro.send_buffer, { desc = "Send buffer to Kiro" })
map("n", "<leader>kf", kiro.fix_lsp_error, { desc = "Fix LSP error with Kiro" })
map("n", "<leader>ka", function()
	vim.ui.input({ prompt = "Ask Kiro: " }, function(input)
		if input then
			kiro.ask(input)
		end
	end)
end, { desc = "Ask Kiro" })
