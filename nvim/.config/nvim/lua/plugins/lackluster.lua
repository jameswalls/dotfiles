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
	lazy = true,
	priority = 1000,
	config = function ()

		local color = require("lackluster.color")
		require("lackluster").setup({
			tweak_syntax = {
				comment = color.gray5,
				keyword = color.gray6,
				keyword_return = color.gray6,
				keyword_exception = color.gray6,
			},
			tweak_background = {
				normal = "none",
				telescope = "none",
			},
			tweak_color = {
				lack   = brighten_hex(color.blue, 20),
				luster = brighten_hex(color.luster, 20),
				orange = brighten_hex(color.orange, 20),
				yellow = brighten_hex(color.yellow, 20),
				green  = brighten_hex(color.green, 20),
				blue   = brighten_hex(color.blue, 20),
				red    = brighten_hex(color.red, 20),
				black  = brighten_hex(color.black, 10),
				gray1  = brighten_hex(color.gray1, 10),
				gray2  = brighten_hex(color.gray2, 10),
				gray3  = brighten_hex(color.gray3, 10),
				gray4  = brighten_hex(color.gray4, 10),
				gray5  = brighten_hex(color.gray5, 10),
				gray6  = brighten_hex(color.gray6, 10),
				gray7  = brighten_hex(color.gray7, 10),
				gray8  = brighten_hex(color.gray8, 10),
				gray9  = brighten_hex(color.gray9, 10),
			},
			tweak_highlight = {
				OilDir = { fg = color.gray7 },
				["@property.json"] = { fg = color.gray7 },
				["@keyword"] = { bold = true },
				["@keyword.exception"] = { bold = true },
				["@keyword.return"] = { bold = true },
				["TelescopeMatching"] = { bold = true },
			}
		})
		print(brighten_hex(color.gray9, 10))
		vim.cmd.colorscheme("lackluster")
	end
}
