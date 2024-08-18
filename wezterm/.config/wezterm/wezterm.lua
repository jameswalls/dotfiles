local palette = {
	foreground = "#ffffff",
	background = "#000000",
	cursor_bg = "#e4e4e4",
	cursor_fg = "#000000",
	cursor_border = "#cbcaf6",
	selection_bg = "#cacaf6",
	selection_fg = "#000000",
	split = "#8e8e8e",
	ansi = {
		"#616161",
		"#ff8272",
		"#b4fa72",
		"#fefdc2",
		"#a5d5fe",
		"#ff8ffd",
		"#d0d1fe",
		"#f1f1f1",
	},
	brights = {
		"#8e8e8e",
		"#ffc4bd",
		"#d6fcb9",
		"#fefdd5",
		"#c1e3fe",
		"#ffb1fe",
		"#e5e6fe",
		"#feffff",
	}
}

local function capture_command_output(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result:match("^%s*(.-)%s*$") -- Trim leading and trailing whitespace
end

local function file_exists(path)
	local f=io.open(path,"r")
	if f~=nil then
		io.close(f)
		return true
	else
		return false
	end
end

local setup_background = function()
	local username = capture_command_output("whoami")
	local wallpaper_path = "/Users/" .. username .. "/.config/wezterm/wallpaper.jpg"
	local background = {}
	local opacity
	if file_exists(wallpaper_path) then
		local background_image = {
			source = {
				File = wallpaper_path,
			},
			horizontal_align = "Center",
		}
		table.insert(background, background_image)
		opacity = 0.70
	else
		opacity = 1
	end

	table.insert(background, {
		source = {
			Color = palette.background
		},
		width = "100%",
		height = "100%",
		opacity = opacity,
	})

	return background
end

local wezterm = require('wezterm')
local mux = wezterm.mux

local config = wezterm.config_builder()
config.initial_rows = 25
config.initial_cols = 110

config.hide_tab_bar_if_only_one_tab = true

local font_family = "JetBrains Mono"
config.font = wezterm.font({
	family = font_family,
	weight = "Regular",
	harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
})
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = font_family,
			weight = "Bold"
		})
	}
}
config.font_size = 21
config.line_height = 1.1
config.window_padding = {
  left = "0.5cell",
  right = "0.5cell",
  top = "0.1cell",
  bottom = "0.1cell",
}
-- config.colors = palette
config.background = setup_background()
config.window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW"
config.window_close_confirmation = 'NeverPrompt'
config.color_scheme = "catppuccin-mocha"

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
