local wezterm = require('wezterm')
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
	if not handle then
		error(command .. " did not return any output")
	end
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

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return 'Dark'
end

local function scheme_for_appearance(appearance, sync_os)
	local scheme
	if sync_os or false then
		if appearance:find 'Dark' then
			scheme = 'NvimDark'
		else
			scheme = 'NvimLight'
		end
	else
		scheme = 'NvimDark'
	end
	return scheme
end

local function get_font_weights(appearance, sync_os)
	-- https://wezfurlong.org/wezterm/config/lua/wezterm/font.html
	local normal_weight, bold_weight
	if sync_os or false then
		if appearance:find 'Dark' then
			normal_weight = "DemiBold"
			bold_weight = "Bold"
		else
			normal_weight = "DemiBold"
			bold_weight = "ExtraBold"
		end
	else
		normal_weight = "DemiBold"
		bold_weight = "ExtraBold"
	end
	return normal_weight, bold_weight
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

local mux = wezterm.mux
local appearance = get_appearance()
local config = wezterm.config_builder()
config.initial_rows = 25
config.initial_cols = 110

config.hide_tab_bar_if_only_one_tab = true

local sync_os = false
local font_family = "JetBrainsMonoNL Nerd Font"
local font_weight, bold_weight = get_font_weights(appearance, sync_os)
config.font = wezterm.font({
	family = font_family,
	weight = font_weight,
	harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
})
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = font_family,
			weight = bold_weight,
		})
	}
}
config.font_size = 21
config.line_height = 1.2
config.cell_width = 1
config.window_padding = {
  left = "0.6cell",
  right = "0.6cell",
  top = "0.1cell",
  bottom = "0.1cell",
}
-- config.background = setup_background()
-- config.color_scheme = scheme_for_appearance(appearance, sync_os)
config.window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW"
config.window_close_confirmation = 'NeverPrompt'
config.force_reverse_video_cursor = true
config.bold_brightens_ansi_colors = true

config.quick_select_patterns = {
	"(?:dev|qa|stage|prod|beauto)-\\w+-(?:vdevelop|v\\d+-\\d+-\\d)-\\w+-v\\d+x-\\w+-\\w+-(?:\\w|\\d){10}-(?:\\w|\\d){5}",
	"(?:[a-z0-9]{16})",
	"(?<=git\\().*?(?=\\))",
}

wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
