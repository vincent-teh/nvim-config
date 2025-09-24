local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
	s("main", {
		t("int main(int argc, char *argv[])"),
		t({ "", "{" }),
		i(0),
		t({ "", "\treturn EXIT_SUCCESS;" }),
		t({ "", "}" }),
	}, {
		description = "Standard main() snippet",
	}),

	s("inc", {
		t('#include "'),
		i(1),
		t('"'),
		i(2),
	}, {
		description = 'Code snippet for #include " "',
	}),

	-- #include <...>
	s("inc<", {
		t("#include <"),
		i(1),
		t(">"),
		i(2),
	}, {
		description = "Code snippet for #include < >",
	}),

	-- #define
	s("def", {
		t("#define "),
		i(0),
	}, {
		description = "Code snippet for #define",
	}),

	s("std", {
		t("std::"),
	}, {
		description = "Shortcut for std::",
	}),

	s("class", {
		-- class declaration
		t("class "),
		i(1, "MyClass"),
		t({ " {", "public:" }),
		t({ "", "\t" }),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t("();"),
		t({ "", "\t" }),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t("($1 &&) = default;"),
		t({ "", "\t" }),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t("(const "),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t(" &) = default;"),
		t({ "", "\t" }),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t(" &operator=("),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t(" &&) = default;"),
		t({ "", "\t" }),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t(" &operator=(const "),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t(" &) = default;"),
		t({ "", "\t~" }),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t(";"),
		t({ "", "", "private:" }),
		t({ "", "\t" }),
		i(2),
		t({ "", "};", "" }),
		-- constructor definition
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t("::"),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t("() {"),
		t({ "" }),
		t("}"),
		t({ "" }),
		-- destructor definition
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t("::~"),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t("() {"),
		t({ "" }),
		t("}"),
	}, {
		description = "Code snippet for class",
	}),
}
