return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "lua_ls", },
      })
      lspconfig.pyright.setup({ capabilities = capabilities } )
      lspconfig.lua_ls.setup( { capabilities = capabilities } )
    end,
  },
}
