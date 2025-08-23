return {
	"echasnovski/mini.comment",
	version = "*",
	opts = {
		mappings = {
			comment = "<leader>c", -- normal + visual, motion-based
			comment_line = "<leader>cc", -- current line
			comment_visual = "<leader>cv", -- visual selection
			textobject = "gc", -- comment textobject like dgc
		},
	},
}
