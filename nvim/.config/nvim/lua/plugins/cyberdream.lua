return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
	config = function ()
		require("cyberdream").setup({
			variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
			transparent = true,
			saturation = 1,
			italic_comments = false,
			hide_fillchars = false,
			borderless_pickers = false,
			terminal_colors = true,
			cache = false,
			highlights = {
				-- Comment = { fg = "#696969", bg = "NONE", italic = true },
			},
			overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
				return {
					-- Comment = { fg = colors.green, bg = "NONE", italic = true },
					Cursor = { reverse = true },
					["@keyword"] = { fg = colors.magenta, bold = true },
				}
			end,

			-- Override a color entirely
			colors = {
				-- For a list of colors see `lua/cyberdream/colours.lua`
				-- Example:
				-- bg = "#000000",
				-- green = "#00ff00",
				-- magenta = "#ff00ff",
			},

			-- Disable or enable colorscheme extensions
			extensions = {
				telescope = true,
				notify = true,
				mini = true,
			},
		})
		vim.cmd.colorscheme("cyberdream")
	end
}
