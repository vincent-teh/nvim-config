-- plugins.lua
return {
	{
		name = "amazonq",
		enabled = false,
		url = "https://github.com/awslabs/amazonq.nvim.git",
		config = function(_, opts)
			require("amazonq").setup({
				-- REQUIRED: SSO portal URL for authentication
				ssoStartUrl = "https://view.awsapps.com/start",
				-- OR
				-- ssoStartUrl = 'your-organization-sso-url', -- For Pro subscription

				-- Command to start Amazon Q Language Server
				-- Defaults to the language server bundled with this plugin
				-- cmd = { "node", "language-server/build/aws-lsp-codewhisperer-token-binary.js", "--stdio" },
				cmd = { "kiro-cli", "chat", "--stdio" },

				-- Filetypes where the Q will be activated
				-- See: https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/q-language-ide-support.html
				-- `amazonq` is required for Q Chat feature.
				filetypes = {
					"amazonq",
					"bash",
					"java",
					"python",
					"typescript",
					"javascript",
					"csharp",
					"ruby",
					"kotlin",
					"sh",
					"sql",
					"c",
					"cpp",
					"go",
					"rust",
					"lua",
				},

				-- Enable/disable inline code suggestions
				inline_suggest = true,

				-- Configure the chat panel position and appearance
				on_chat_open = function()
					vim.cmd([[
					  vertical topleft split
					  set wrap breakindent nonumber norelativenumber nolist
					]])
				end,

				-- Enable debug mode for development
				debug = false,
			})
		end,
	},
}
