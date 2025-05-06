return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local theme = require("lualine.utils.loader").load_theme("auto")
    theme.normal.a = { fg="#000000", bg="#ff87ff", gui="bold" }
    theme.normal.b = { fg="#ff87ff" }
		theme.normal.c = { bg="NONE" }
		theme.insert.a = { fg="#000000", bg="#ffd787", gui="bold" }
		theme.insert.b = { fg="#ffd787" }
		theme.insert.c = { bg="NONE" }
		theme.replace.c = { bg="NONE" }
		theme.visual.a = { fg="#000000", bg="#5fafaf", gui="bold" }
		theme.visual.b = { fg="#5fafaf" }
		theme.visual.c = { bg="NONE" }
    theme.command.a = { fg="#000000", bg="#5fafff", gui="bold" }
		theme.command.b = { fg="#5fafff" }
		theme.command.c = { bg="NONE" }

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = theme,
				component_separators = { left = "", right = ""},
				section_separators = { left = "", right = ""},
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				}
			},
			sections = {
				lualine_a = {"mode"},
				lualine_b = {{ "branch", fmt = function(str) return str:sub(1,30) end}, "diff" },
				lualine_c = {{ "filename", path=4 }},
				lualine_x = { "diagnostics" },
				lualine_y = {"progress"},
				lualine_z = {"location"}
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {"filename"},
				lualine_x = {"location"},
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {}
		})
	end
}
