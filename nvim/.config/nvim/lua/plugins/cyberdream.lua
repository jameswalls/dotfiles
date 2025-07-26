return {
	"scottmckendry/cyberdream.nvim",
	lazy = true,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			variant = "default",
			transparent = true,
			italic_comments = false,
			hide_fillchars = false,
			borderless_pickers = false,
			terminal_colors = true,
			cache = true,
			extensions = {
				telescope = true,
				notify = true,
				mini = true,
			},
			highlights = {
				TelescopeBorder = { fg = "#ffffff" },
				FloatBorder = { fg = "#ffffff" },
				Cursor = { reverse = true },
				CursorLineNr = { fg = "#ffffff", bold = true },
				Keyword = { fg = "#ffbd5e", bold = true },
				["@keyword.type"] = { fg = "#ffbd5e", italic = false, bold = true },
			},
		})

		vim.cmd.colorscheme("cyberdream")
	end,
}
