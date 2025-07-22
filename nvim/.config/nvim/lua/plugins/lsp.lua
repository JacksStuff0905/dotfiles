return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  --[[{
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed =
          {
            "lua_ls",
            "pyright",
            "omnisharp",
            "bashls",
          }
      })
    end
  },]]
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Language servers
          "lua-language-server",
          "pyright",
          "omnisharp",
          "bash-language-server",
          "clangd",
          "docker-compose-language-service",
          "dockerfile-language-server",

          -- Linters
          "cpplint",
          "hadolint",
          "black",
          "gdtoolkit",

          -- Formatters
          "stylua",
          "clang-format",
          "isort",
        },
        auto_update = true,
        run_on_start = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.omnisharp.setup({})
      lspconfig.bashls.setup({})
    end,
  },
}
