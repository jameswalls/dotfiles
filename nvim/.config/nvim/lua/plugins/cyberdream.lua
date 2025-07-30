return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local c = require("cyberdream.colors").default
		local is_bold = false
		require("cyberdream").setup({
			variant = "default",
			transparent = false,
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
				TelescopeMatching = { fg = c.red, bold = is_bold },
				TelescopeBorder = { fg = c.grey },
				FloatBorder = { fg = c.grey },
				Cursor = { reverse = true },
				CursorLineNr = { fg = "#ffffff", bold = is_bold },
				Keyword = { fg = "#ffbd5e", bold = is_bold },
				["@keyword.type"] = { fg = "#ffbd5e", italic = false, bold = is_bold },
				PreProc = { fg = c.pink },
				["@spell"] = { fg = c.grey },
			},
		})

		vim.cmd.colorscheme("cyberdream")
	end,
}
