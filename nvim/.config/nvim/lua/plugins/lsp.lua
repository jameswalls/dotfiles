return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"j-hui/fidget.nvim",
			enabled = true,
			opts = {
				progress = {
					suppress_on_insert = true,
					display = {
						render_limit = 1,
					}
				},
				notification = {
					window = {
						winblend = 0
					}
				}
			}
		},
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				local telescope = require("telescope.builtin")
				map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
				map("gr", telescope.lsp_references, "[G]oto [R]eferences")
				map("gI", telescope.lsp_implementations, "[G]oto [I]mplementation")
				map("<leader>D", telescope.lsp_type_definitions, "Type [D]efinition")
				map("<leader>ds", function() telescope.lsp_document_symbols({symbol_width=60}) end, "[D]ocument [S]ymbols")
				map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("<leader>td", telescope.lsp_type_definitions, "[W]orkspace [S]ymbols")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("H", vim.lsp.buf.signature_help, "Signature [H]elp")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("<leader>e", vim.diagnostic.open_float, "Diagnostic float")
				map("<leader>q", vim.diagnostic.setloclist, "Add all diagnostics to qfixlist")
				map("[d", vim.diagnostic.goto_prev, "Go to previous [D]iagnostic message")
				map("]d", vim.diagnostic.goto_next, "Go to next [D]iagnostic message")

			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			lua_ls = {
				enabled = true,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = { vim.env.VIMRUNTIME },
						},
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = { disable = { "missing-fields" } },
					},
				},
			},
			pylsp = {
				enabled = true,
				filetypes = { "python" },
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								enabled = true,
								maxLineLength = 120,
							},
							jedi_completion = {
								enabled = true,
								include_function_objects = false,
								include_class_objects = false,
							},
						}
					}
				}
			},
			rust_analyzer = {
				enabled = true,
			},
		}

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua",
		})

		require("mason-tool-installer").setup { ensure_installed = ensure_installed }

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					if server["enabled"] then
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end
				end,
			},
		})
	end
}
