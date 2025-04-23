local function brighten_hex(hex, amount)
    hex = hex:gsub("#","")
    local r = tonumber("0x"..hex:sub(1,2))
    local g = tonumber("0x"..hex:sub(3,4))
    local b = tonumber("0x"..hex:sub(5,6))

    r = math.min(255, r + amount)
    g = math.min(255, g + amount)
    b = math.min(255, b + amount)

    return string.format("#%02x%02x%02x", r, g, b)
end

return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	config = function ()

		local color = require("lackluster.color")
		require("lackluster").setup({
			tweak_syntax = {
				-- comment = color.gray5,
				keyword = color.gray6,
				keyword_return = color.gray6,
				keyword_exception = color.gray6,
			},
			tweak_background = {
				normal = "none",
				telescope = "none",
			},
			tweak_highlight = {
				OilDir = { fg = color.gray7 },
				["@property.json"] = { fg = color.gray7 },
				["@keyword"] = { bold = true },
				["@keyword.exception"] = { bold = true },
				["@keyword.return"] = { bold = true },
				["TelescopeMatching"] = { fg=color.orange, bold = true, italic = false },
			}
		})
		print(brighten_hex(color.gray9, 10))
		vim.cmd.colorscheme("lackluster")
	end
}
