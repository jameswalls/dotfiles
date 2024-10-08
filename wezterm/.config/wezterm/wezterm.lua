local palette = {
	foreground = "#e0e2ea",
	background = "#14161b",
	cursor_bg = "#9b9ea4",
	cursor_border = "#9b9ea4",
	cursor_fg = "#e0e2ea",
	selection_bg = "#4f5258",
	selection_fg = "#e0e2ea",
	ansi = {
		"#07080d",
		"#ffc0b9",
		"#b3f6c0",
		"#fce094",
		"#a6dbff",
		"#ffcaff",
		"#8cf8f7",
		"#eef1f8"
	},
	brights = {
		"#4f5258",
		"#ffc0b9",
		"#b3f6c0",
		"#fce094",
		"#a6dbff",
		"#ffcaff",
		"#8cf8f7",
		"#eef1f8"
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
			horizontal_align = "Right",
		}
		table.insert(background, background_image)
		opacity = 0.8

		table.insert(background, {
			source = {
				Color = palette.background
			},
			width = "100%",
			height = "100%",
			opacity = opacity,
		})
	end
	return background
end

local wezterm = require('wezterm')
local mux = wezterm.mux

local config = wezterm.config_builder()
config.initial_rows = 25
config.initial_cols = 110

config.hide_tab_bar_if_only_one_tab = true

local font_family = "JetBrainsMonoNL Nerd Font"
config.font = wezterm.font({
	family = font_family,
	weight = "Medium",
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
config.background = setup_background()
config.window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW"
config.window_close_confirmation = 'NeverPrompt'
config.force_reverse_video_cursor = true
config.bold_brightens_ansi_colors = true

wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
