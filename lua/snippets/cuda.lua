local ls = require("luasnip")
ls.filetype_extend("cuda", { "cpp" })
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {}
