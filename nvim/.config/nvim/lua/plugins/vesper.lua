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
			palette_overrides = {},
			overrides = {
				CursorLineNr = { bg='none', bold=true },
				Conditional = { fg=colors.borderDarker, bold=true },
				Statement = { fg=colors.borderDarker, bold=true },
			},
		})
		vim.cmd.colorscheme("vesper")
	end
}
