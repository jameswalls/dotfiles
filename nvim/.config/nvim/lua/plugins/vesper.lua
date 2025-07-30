return {
	"datsfilipe/vesper.nvim",
	lazy = true,
	priority = 1000,
	config = function()
		local colors = require("vesper.colors")
		local mix = require("vesper.utils").mix
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
				fg = mix(colors.fg, "#000000", math.abs(0.70)),
				white = mix(colors.white, "#000000", math.abs(0.70)),
				greenLight = colors.red,
				green = colors.redDark,
				red = colors.greenLight,
				comment = mix(colors.comment, "#000000", math.abs(0.45)),
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
				Statement = { fg = mix(colors.primary, "#000000", 0.60), bold = true },
				TelescopeBorder = { fg = colors.border },
				TelescopeMatching = { fg = colors.red, bold = true },
				TelescopeSelection = { bg = colors.fgSelection },
				VertSplit = { fg = colors.border, bg = "none" },
			},
		})
		vim.cmd.colorscheme("vesper")
	end,
}
