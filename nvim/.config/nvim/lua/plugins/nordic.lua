return {
	"jameswalls/nordic.nvim",
	branch = "palette_completions",
	lazy=true,
	config = function()
		require("nordic").setup({
			on_palette = function(colors)
			end
		})

	vim.cmd.colorscheme("nordic")
	end
}
