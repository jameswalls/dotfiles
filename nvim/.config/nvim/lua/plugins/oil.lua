return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			columns = { "icon" },
			watch_for_changes = true,
			view_options = {
				natural_order = false,
			},
			keymaps = {
				["<C-p>"] = function() oil.open_preview({ horizontal=true }) end,
				["g."] = "actions.toggle_hidden",
				["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
				["<C-x>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
			}
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end
}
