return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nordic").setup({
			transparent = { bg = true, float = true },
			bright_border = true,
			reduced_blue = false,
			bold_keywords = true,
			on_highlight = function(highlights, palette)
				highlights.CursorLineNr = { fg = palette.yellow.bright, bold = true }
				highlights.LineNr = { fg = palette.grey5 }
				highlights.TelescopeSelection = { fg=palette.yellow.bright, bg=palette.bg_selected, bold=true }
				highlights['@parameter'] = { fg=palette.fg }
			end,
			telescope = {
				style = "classic",
			},
		})
		vim.cmd.colorscheme("nordic")
	end
}
