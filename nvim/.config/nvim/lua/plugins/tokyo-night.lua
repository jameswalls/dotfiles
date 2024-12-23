return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "storm",
			transparent = true,
			styles = {
				comments = { italic = false },
				keywords = { italic = false, bold=true },
			},
			on_highlights = function(hl, c)
				hl.Visual = { bg= c.blue0 }
				hl.LineNrAbove = { fg=c.blue }
				hl.LineNrBelow = { fg=c.blue }
				hl.DiagnosticVirtualTextError = { fg=c.red }
				hl.DiagnosticVirtualTextHint = { fg=c.green1 }
				hl.DiagnosticVirtualTextWarn = { fg=c.yellow }
				hl.TelescopeNormal = {}
				hl.TelescopeBorder = {}
				hl.TelescopePromptBorder = {}
				hl.TelescopePromptTitle = { fg = c.orange }
				hl.TelescopePreviewTitle = { fg = c.orange }
				hl.TelescopePromptTitle = { fg = c.orange }
				hl.TelescopeResultstitle = { fg = c.orange }
			end,
		})

		vim.cmd.colorscheme("tokyonight")
	end
}
