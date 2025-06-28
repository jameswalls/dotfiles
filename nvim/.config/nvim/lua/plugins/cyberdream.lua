return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
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
				["@keyword.type"] = { fg = "#ffbd5e", italic = false },
			},
		})

		vim.cmd.colorscheme("cyberdream")
	end,
}
