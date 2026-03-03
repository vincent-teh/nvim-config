return {
  "lervag/vimtex",
  ft = "tex",
  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = "build",
      out_dir = "",
      options = {
        "-pdf",
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }
  end,
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "tex",
      callback = function(ev)
        vim.keymap.set("n", "<localleader>p", function()
          vim.cmd("VimtexCompile")
          vim.cmd("VimtexView")
        end, { buffer = ev.buf, desc = "Compile and preview" })
        vim.keymap.set("n", "<localleader>lv", "<cmd>VimtexView<cr>", { buffer = ev.buf, desc = "View PDF" })
        vim.keymap.set("n", "<localleader>lk", "<cmd>VimtexStop<cr>", { buffer = ev.buf, desc = "Stop compilation" })
        vim.keymap.set("n", "<localleader>le", "<cmd>VimtexErrors<cr>", { buffer = ev.buf, desc = "Show errors" })
        vim.keymap.set("n", "gf", "<plug>(vimtex-include-search)", { buffer = ev.buf, desc = "Go to file" })
      end,
    })
  end,
}
