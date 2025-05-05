return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_kinds = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰜢",
			Variable = "󰀫",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "󰑭",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "󰈇",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "󰙅",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "",
		}

		local cmp_menus = {
			buffer = "[Buffer]",
			nvim_lsp = "[LSP]",
			luasnip = "[LuaSnip]",
			nvim_lua = "[Lua]",
			latex_symbols = "[LaTeX]",
		}

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			view = {
				entries = { "custom" },
			},
			completion = {
				completeopt = "menu,menuone,preview"
			},
			mapping = cmp.mapping.preset.insert({
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert}),
			}),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
      },
			formatting = {
				fields = { "kind", "abbr", "menu"},
				format = function(entry, vim_item)
					vim_item.kind = cmp_kinds[vim_item.kind] or " "
          print(vim.o.columns)
          vim_item.abbr = string.sub(vim_item.abbr, 1, 0.4 * vim.o.columns)
					vim_item.menu = cmp_menus[entry.source.name]
					return vim_item
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "path"},
				{ name = "nvim_lsp_signature_help" }
			})
		})
	end
}
