return {
	"jameswalls/nordic.nvim",
	branch = "palette_completions",
	lazy=true,
	config = function()
		require("nordic").setup({})

	vim.cmd.colorscheme("nordic")
	end
}
