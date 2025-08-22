return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add          = { text = "▎" },
      change       = { text = "▎" },
      delete       = { text = "▎" },
      topdelete    = { text = "▎" },
      changedelete = { text = "▎" },
      untracked    = { text = "▎" },
    },
    signcolumn = true,  -- show in the left gutter
    numhl      = false, -- disable number highlighting
    linehl     = false, -- disable whole-line highlighting
    word_diff  = false, -- disable word diff by default

    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },

    attach_to_untracked = true,
    current_line_blame = false, -- toggle with :Gitsigns toggle_current_line_blame
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 500,
      ignore_whitespace = false,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  },
}
