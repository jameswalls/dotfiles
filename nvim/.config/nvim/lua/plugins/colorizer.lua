return {
	"norcalli/nvim-colorizer.lua",
	lazy=false,
	config = function()
		require("colorizer").setup({
			"lua", "json", "markdown";
		})
	end
}
