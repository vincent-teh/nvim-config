local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	-- snippet trigger: "main"
	s("main", {
		t('if __name__ == "__main__":'),
		t({ "", "\t" }), -- newline + indentation
		i(0, "pass"), -- final cursor position, default to pass
	}),
}
