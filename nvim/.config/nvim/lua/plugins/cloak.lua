return {
	"laytan/cloak.nvim",
	config = function()
		require("cloak").setup({
			enabled = true,
			cloak_character = "x",
			highlight_group = "Comment",
			cloak_length = 10,
			try_all_patterns = true,
			patterns = {
				{
					file_pattern = {
						".env*",
						".zshrc",
						".bashrc",
					},
					cloak_pattern ={ "=.+", ":.+" },
					replace = nil,
				},
			},
		})
	end
}
