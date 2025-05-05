return {
	"folke/tokyonight.nvim",
	lazy = true,
	priority = 1000,
	config = function ()
		require("tokyonight").setup({
			style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
			light_style = "day", -- The theme is used when the background is set to light
			transparent = true, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				comments = { italic = false },
				keywords = { italic = false, bold = true },
				functions = {},
				variables = {},
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "dark", -- style for sidebars, see below
				floats = "transparent", -- style for floating windows
			},
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			dim_inactive = false, -- dims inactive windows
			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

			---@param colors ColorScheme
			on_colors = function(colors) end,

			---@param highlights tokyonight.Highlights
			---@param colors ColorScheme
			on_highlights = function(highlights, colors)
        highlights["Cursor"] = { reverse=true }
				highlights.String = { fg=colors.red }
        highlights["@keyword.import.python"] = { fg=colors.purple, bold=true }
        highlights["@keyword.conditional"] = { fg=colors.purple, bold=true }
        highlights["@keyword.exception"] = { fg=colors.purple, bold=true }
        highlights["@keyword.repeat"] = { fg=colors.purple, bold=true }
				highlights["@variable.builtin"] = { fg=colors.fg_float }
				highlights["FloatBorder"] = { fg=colors.fg_float }
				highlights["TelescopeBorder"] = { fg=colors.fg_float }
				highlights["TelescopeMatching"] = { fg=colors.yellow, bold=true }
				highlights["TelescopePromptBorder"] = { fg=colors.fg_float }
			end,

			cache = true, -- When set to true, the theme will be cached for better performance

			---@type table<string, boolean|{enabled:boolean}>
			plugins = {
				-- enable all plugins when not using lazy.nvim
				-- set to false to manually enable/disable plugins
				all = package.loaded.lazy == nil,
				-- uses your plugin manager to automatically enable needed plugins
				-- currently only lazy.nvim is supported
				auto = true,
				-- add any plugins here that you want to enable
				-- for all possible plugins, see:
				--   * https://github.com/folke/tokyonight.nvim/tree/main/lua/tokyonight/groups
				-- telescope = true,
			},
		})
		vim.cmd.colorscheme("tokyonight")
	end
}
