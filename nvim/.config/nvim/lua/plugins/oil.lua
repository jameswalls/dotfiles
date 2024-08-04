return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			columns = { "icon" },
			view_options = {
				natural_order = false,
			},
			keymaps = {
				["<C-p>"] = function() oil.open_preview({ horizontal=true }) end,
				["g."] = "actions.toggle_hidden",
			}
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc="Open parent directory" })
	end
}
