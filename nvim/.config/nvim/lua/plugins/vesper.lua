return {
	"datsfilipe/vesper.nvim",
	lazy = true,
	priority = 1000,
	config = function ()
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
				redDark = colors.green
			},
			overrides = {
        Cursor = { reverse=true },
        DiagnosticUnderlineError = {},
        DiagnosticVirtualTextError = { fg=colors.hint },
				Conditional = { fg=colors.borderDarker, bold=true },
				CursorLineNr = { bg='none', bold=true },
        NormalFloat = { bg = 'none' },
				Statement = { fg=colors.borderDarker, bold=true },
				TelescopeMatching = { fg=colors.red },
				TelescopeSelection = { bg=colors.fgSelection },
        VertSplit = { bg = 'none' },
			},
		})
		vim.cmd.colorscheme("vesper")
	end
}
