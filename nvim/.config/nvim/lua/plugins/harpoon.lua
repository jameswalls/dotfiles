return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local nav_opts = { ui_nav_wrap = true}

		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			}
		})

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
		vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
		vim.keymap.set("n", "<space>a", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<space>s", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<space>d", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<space>f", function() harpoon:list():select(4) end)
		vim.keymap.set("n", "<space>g", function() harpoon:list():select(5) end)
		vim.keymap.set("n", "<leader>p", function() harpoon:list():prev(nav_opts) end)
		vim.keymap.set("n", "<leader>n", function() harpoon:list():next(nav_opts) end)
	end
}
