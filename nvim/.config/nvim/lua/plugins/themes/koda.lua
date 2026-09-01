vim.pack.add({
	"https://github.com/oskarnurm/koda.nvim",
})

require("koda").setup({
	theme = {
		dark = "dark",
		light = "light",
	},
	transparent = true,
	auto = true,
	cache = true,
	styles = {
		functions = {},
		keywords = {},
		comments = {},
		strings = {},
		constants = {}, -- includes numbers, booleans
	},
	colors = {},
	on_highlights = function(_, _) end,
})
vim.cmd.colorscheme("koda-moss")
