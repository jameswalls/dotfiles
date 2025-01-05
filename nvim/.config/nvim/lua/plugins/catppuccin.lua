return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = true,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = {  }, -- Change the style of comments
				conditionals = { "bold" },
				loops = { "bold" },
				functions = {},
				keywords = { "bold" },
				strings = {},
				variables = {},
				numbers = {},
				booleans = { "bold" },
				properties = { },
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {},
			custom_highlights = function(colors)
				return {
					["@module"] = { style = {} },
					LineNr = { fg=colors.surface2 },
					TelescopeSelection = { bg = colors.surface1 },
					DiagnosticVirtualTextError = { style = {} },
					DiagnosticVirtualTextHint = { style = {} },
					DiagnosticVirtualTextInfo = { style = {} },
					DiagnosticVirtualTextOk = { style = {} },
					DiagnosticVirtualTextWarn = { style = {} },
				}
			end,
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = false,
				treesitter = true,
				notify = false,
				mini = {
					enabled = false,
					indentscope_color = "",
				},
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end
}
