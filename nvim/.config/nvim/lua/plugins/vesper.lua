return {
	"datsfilipe/vesper.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local colors = require("vesper.colors")
		require("vesper").setup({
			transparent = true,
			italics = {
				comments = false,
				keywords = false,
				functions = false,
				strings = false,
				variables = false,
			},
			palette_overrides = {
				greenLight = colors.red,
				green = colors.redDark,
				red = colors.greenLight,
				redDark = colors.green,
			},
			overrides = {
				Boolean = { fg = colors.redDark, bold = true },
				Conditional = { fg = colors.borderDarker, bold = true },
				Cursor = { reverse = true },
				CursorLineNr = { bg = "none", bold = true },
				DiagnosticUnderlineError = {},
				DiagnosticVirtualTextError = { fg = colors.hint },
				FloatBorder = { fg = colors.border },
				NormalFloat = { bg = "none" },
				Statement = { fg = colors.borderDarker, bold = true },
				TelescopeBorder = { fg = colors.border },
				TelescopeMatching = { fg = colors.red, bold = true },
				TelescopeSelection = { bg = colors.fgSelection },
				VertSplit = { fg = colors.border, bg = "none" },
			},
		})
		vim.cmd.colorscheme("vesper")
	end,
}
