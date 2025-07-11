local function brighten_hex(hex, amount)
	hex = hex:gsub("#", "")
	local r = tonumber("0x" .. hex:sub(1, 2))
	local g = tonumber("0x" .. hex:sub(3, 4))
	local b = tonumber("0x" .. hex:sub(5, 6))

	r = math.min(255, r + amount)
	g = math.min(255, g + amount)
	b = math.min(255, b + amount)

	return string.format("#%02x%02x%02x", r, g, b)
end

return {
	"slugbyte/lackluster.nvim",
	lazy = true,
	priority = 1000,
	config = function()
		local color = require("lackluster.color")
		require("lackluster").setup({
			disable_plugin = {},
			tweak_background = {
				normal = "none",
				popup = "none",
				telescope = "none",
			},
			tweak_highlight = {
				OilDir = { fg = color.blue },
				-- Normal = { bg = color.gray2, fg = color.luster },
				-- NormalFloat = { bg = color.none },
				VertSplit = { bg = color.gray2, fg = color.luster },
				["@property.json"] = { fg = color.gray7 },
				["@keyword"] = { fg = color.blue, bold = true },
				["@keyword.exception"] = { fg = color.blue, bold = true },
				["@keyword.return"] = { fg = color.blue, bold = true },
				TelescopeMatching = { fg = color.orange, bold = true, italic = false },
				-- TelescopeBorder = { bg = color.gray2 },
				-- TelescopeNormal = { bg = color.gray2 },
				-- TelescopeSelection = { bg = color.gray4 },
				TelescopeResultsNormal = { bg = color.none },
				-- SignColumn = { bg = color.gray2 },
				GitSignsAdd = { bg = color.gray2, fg = color.green },
				GitSignsChange = { bg = color.gray2, fg = color.yellow },
				GitSignsDelete = { bg = color.gray2, fg = color.red },
				DiagnosticWarn = { fg = color.yellow },
				DiagnosticError = { fg = color.red },
			},
		})
		vim.cmd.colorscheme("lackluster")
	end,
}
