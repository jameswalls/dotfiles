return {
	"gambhirsharma/vesper.nvim",
	lazy = false,
	priority = 1000,
	name = "vesper",
	config = function ()
		require("vesper").setup({
			terminal_colors = true,
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true,
			contrast = "",
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = true,
		})
		vim.cmd.colorscheme("vesper")
	end
}
