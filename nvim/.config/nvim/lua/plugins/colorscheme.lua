return {
	{
		'AlexvZyl/nordic.nvim',
		lazy = true,
		priority = 1000,
		config = function()
			local palette = require 'nordic.colors'
			require 'nordic' .setup {
				-- This callback can be used to override the colors used in the palette.
				on_palette = function(palette) return palette end,
				-- Enable bold keywords.
				bold_keywords = true,
				-- Enable italic comments.
				italic_comments = true,
				-- Enable general editor background transparency.
				transparent_bg = false,
				-- Enable brighter float border.
				bright_border = true,
				-- Reduce the overall amount of blue in the theme (diverges from base Nord).
				reduced_blue = true,
				-- Swap the dark background with the normal one.
				swap_backgrounds = false,
				-- Override the styling of any highlight group.
				override = {},
				-- Cursorline options.  Also includes visual/selection.
				cursorline = {
					-- Bold font in cursorline.
					bold = false,
					-- Bold cursorline number.
					bold_number = true,
					-- Available styles: 'dark', 'light'.
					theme = 'dark',
					-- Blending the cursorline bg with the buffer bg.
					blend = 1,
				},
				noice = {
					-- Available styles: `classic`, `flat`.
					style = 'classic',
				},
				telescope = {
					-- Available styles: `classic`, `flat`.
					style = 'classic',
				},
				leap = {
					-- Dims the backdrop when using leap.
					dim_backdrop = false,
				},
				ts_context = {
					-- Enables dark background for treesitter-context window
					dark_background = true,
				}
			}
			require 'nordic' .load()
		end
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "auto", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
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
					comments = {}, -- Change the style of comments
					conditionals = {},
					loops = { "bold" },
					functions = {},
					keywords = { "bold" },
					strings = {},
					variables = {},
					numbers = {},
					booleans = { "bold" },
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				color_overrides = {},
				custom_highlights = {},
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end
	}
}
