return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
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
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
        local window_opts = { border = "rounded" }
				local telescope = require("telescope.builtin")
				map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
				map("gr", telescope.lsp_references, "[G]oto [R]eferences")
				map("gI", telescope.lsp_implementations, "[G]oto [I]mplementation")
				map("<leader>ds", function() telescope.lsp_document_symbols({symbol_width=60}) end, "[D]ocument [S]ymbols")
				map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("<leader>td", telescope.lsp_type_definitions, "[T]ype [D]efinitions")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ga", vim.lsp.buf.code_action, "[G]et code [a]ctions")
				map("K", function() vim.lsp.buf.hover(window_opts) end , "Hover Documentation")
				map("H", function() vim.lsp.buf.signature_help(window_opts) end, "Signature [H]elp")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("<leader>e", function() vim.diagnostic.open_float(window_opts) end, "Diagnostic float")
				map("[d", function() vim.diagnostic.jump({ count = -1, float = window_opts }) end, "Go to previous [D]iagnostic message")
				map("]d", function() vim.diagnostic.jump({ count = 1, float = window_opts }) end, "Go to next [D]iagnostic message")

			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			pylsp = {
        enabled = false,
				filetypes = { "python" },
				settings = {
					pylsp = {
            configuratinSources = { "pycodestyle", "pyflakes" },
						plugins = {
              pyflakes = {
                enabled = false,
              },
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
      pyright = {
        enabled = true,
				filetypes = { "python" },
				settings = {}
			},
			rust_analyzer = {
        enabled = true,
        filetypes = { "rust" },
        settings = {}
			},
		}

    require("mason").setup({
      registries = {
        "github:mason-org/mason-registry",
      }
    })

		local ensure_installed = vim.tbl_keys(servers or {})
    local exclude = {}
    for server, settings in pairs(servers) do
      if not settings["enabled"] then
        table.insert(exclude, server)
      end
    end

    for server, settings in pairs(servers) do
      if settings["enabled"] then
        vim.lsp.config(server, settings)
      end
    end

		require("mason-lspconfig").setup({
      ensure_installed = ensure_installed,
      automatic_enable = {
        exclude = exclude
      },
		})
	end
}
