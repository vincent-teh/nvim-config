require('config.options')
require('config.keymaps')
require("config.lazy")

vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- or "■", "▎", whatever you like
    spacing = 2,
  },
  underline = true,   -- underline problematic code
  update_in_insert = false,
  severity_sort = true,
})
