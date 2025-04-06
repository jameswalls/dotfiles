return {
	"jameswalls/nordic.nvim",
	lazy=true,
	priority = 1000,
	config = function()
		require("nordic").setup({
			transparent = {
				bg = true,
				float = true
			},
			bright_border = true,
		})
		vim.cmd.colorscheme("nordic")
	end
}
