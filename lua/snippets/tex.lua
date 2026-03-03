local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local rep = require("luasnip.extras").rep

return {
	s("beg", {
		t("\\begin{"),
		i(1, "env"),
		t({ "}", "\t" }),
		i(0),
		t({ "", "\\end{" }),
		rep(1),
		t("}"),
	}),
	s("eqn", {
		t({ "\\begin{equation}", "\t" }),
		i(0),
		t({ "", "\\end{equation}" }),
	}),
	s("align", {
		t({ "\\begin{align}", "\t" }),
		i(0),
		t({ "", "\\end{align}" }),
	}),
	s("gather", {
		t({ "\\begin{gather}", "\t" }),
		i(0),
		t({ "", "\\end{gather}" }),
	}),
	s("item", {
		t({ "\\begin{itemize}", "\t\\item " }),
		i(0),
		t({ "", "\\end{itemize}" }),
	}),
	s("fig", {
		t({ "\\begin{figure}[htbp]", "\t\\centering", "\t\\includegraphics[width=" }),
		i(1, "0.8"),
		t({ "\\textwidth]{" }),
		i(2, "path/to/image"),
		t({ "}", "\t\\caption{" }),
		i(3, "caption"),
		t({ "}", "\t\\label{fig:" }),
		f(function(args)
			return args[1][1]:match("([^/]+)$"):gsub("%.%w+$", "")
		end, { 2 }),
		t({ "}", "\\end{figure}" }),
	}),
	s("ch", {
		t("\\chapter{"),
		i(1, "Chapter Title"),
		t({ "}", "\\label{ch:" }),
		f(function(args)
			return args[1][1]:lower():gsub("%s+", "-")
		end, { 1 }),
		t("}"),
	}),
	s("sec", {
		t("\\section{"),
		i(1, "Section Title"),
		t({ "}", "\\label{sec:" }),
		f(function(args)
			return args[1][1]:lower():gsub("%s+", "-")
		end, { 1 }),
		t("}"),
	}),
	s("ssec", {
		t("\\subsection{"),
		i(1, "Subsection Title"),
		t({ "}", "\\label{ssec:" }),
		f(function(args)
			return args[1][1]:lower():gsub("%s+", "-")
		end, { 1 }),
		t("}"),
	}),
	s("sssec", {
		t("\\subsubsection{"),
		i(1, "Subsubsection Title"),
		t({ "}", "\\label{sssec:" }),
		f(function(args)
			return args[1][1]:lower():gsub("%s+", "-")
		end, { 1 }),
		t("}"),
	}),
	s("cite", {
		t("\\cite{"),
		i(1, "key"),
		t("}"),
	}),
	s("alg", {
		t({ "\\begin{algorithm}[htbp]", "\t\\caption{" }),
		i(1, "Algorithm Title"),
		t({ "}", "\t\\label{alg:" }),
		i(2, "label"),
		t({ "}", "\t" }),
		i(0),
		t({ "", "\\end{algorithm}" }),
	}),
}
