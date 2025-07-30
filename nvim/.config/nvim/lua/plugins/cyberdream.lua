return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local c = require("cyberdream.colors").default
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
				TelescopeMatching = { fg = c.pink, bold = true },
				TelescopeBorder = { fg = c.grey },
				FloatBorder = { fg = c.grey },
				Cursor = { reverse = true },
				CursorLineNr = { fg = "#ffffff" },
				Keyword = { fg = "#ffbd5e" },
				["@keyword.type"] = { fg = "#ffbd5e", italic = false },
				PreProc = { fg = c.pink },
				["@spell"] = { fg = c.grey },
			},
		})

		vim.cmd.colorscheme("cyberdream")
	end,
}
