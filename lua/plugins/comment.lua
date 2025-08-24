return {
	"echasnovski/mini.comment",
	version = "*",
	opts = {
		mappings = {
			-- Only use classic 'gcc' for commenting the current line
			comment_line = "gcc", -- normal mode, current line
			comment = "gc", -- operator-pending, e.g., 'gcip' to comment a paragraph
			comment_visual = "gc", -- visual mode
			textobject = "gc", -- comment textobject (like dgc)
		},
	},
}
