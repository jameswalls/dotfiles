return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	config = function ()
		local color = require("lackluster.color")
		require("lackluster").setup({
			tweak_syntax = {
				comment = color.gray5,
				keyword = color.gray6,
				keyword_return = color.gray6,
				keyword_exception = color.gray6,
			},
			tweak_background = {
				normal = "none",
				telescope = "none",
			},
			tweak_highlight = {
				OilDir = { fg = color.gray7 },
				["@keyword"] = { bold = true },
				["@keyword.exception"] = { bold = true },
				["@keyword.return"] = { bold = true }
			}
		})
		vim.cmd.colorscheme("lackluster")
	end
}
