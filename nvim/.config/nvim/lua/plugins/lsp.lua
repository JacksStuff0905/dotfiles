return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			--[[
      require("mason-lspconfig").setup({
       ensure_installed =
          {
            "lua_ls",
            "pyright",
            "omnisharp",
            "bashls",
          }
      })
      ]]
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
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
          "arduino-language-server",
          "html-lsp",
          "css-lsp",

					-- Linters
					"cpplint",
					"hadolint",
					"black",
					"gdtoolkit",
          "htmlhint",
          "stylelint",

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
		lazy = false,
		opts = {
			servers = {
				gdscript = {},
			},
			setup = {
				gdscript = function(_, opts)
					require("lspconfig").gdscript.setup({
						name = "godot",

						-- Fill in your Godot Language Server parameters
						cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),

						-- Fill in where should Neovim listen to Godot LSP
						-- In this case, "/tmp/godot.pipe"
						on_init = function(client, init_result)
							vim.fn.serverstart("/tmp/godot.pipe")
						end,
					})
					return true
				end,
			},
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.omnisharp.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
      lspconfig.gdscript.setup({
				capabilities = capabilities,
			})
      local FQBN = "arduino:avr:uno"
      lspconfig.arduino_language_server.setup({
				capabilities = capabilities,
        cmd = {
          "arduino-language-server",
          "-cli-config", "~/.arduino15/arduino-cli.yaml",
          "-fqbn",
          FQBN
        }
			})
      lspconfig.html.setup({
				capabilities = capabilities,
			})
      lspconfig.cssls.setup({
				capabilities = capabilities,
			})
		end,
	},
}
