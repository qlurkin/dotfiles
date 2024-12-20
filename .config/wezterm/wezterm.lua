local wezterm = require("wezterm")

math.randomseed(os.time())

local GLOB_PATTERN = "*.{jpg,jpeg,png,gif,bmp,ico,tiff,pnm,dds,tga}"

local files = wezterm.glob("/Users/lur/Pictures/Wallpapers/" .. GLOB_PATTERN)

local id = math.random(#files)

local config = {}

config.color_scheme = "Dracula (Official)"
-- config.color_scheme = "Catppuccin Frappe"

config.font = wezterm.font("FiraCode Nerd Font")
config.enable_kitty_keyboard = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = true
config.integrated_title_button_style = "MacOsNative"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.inactive_pane_hsb = {
	saturation = 0.5,
	brightness = 0.5,
}

-- config.background = {
-- 	{
-- 		source = {
-- 			File = files[id],
-- 		},
-- 		vertical_align = "Middle",
-- 		horizontal_align = "Center",
-- 	},
-- 	{
-- 		source = {
-- 			Color = "rgb(30,31,41)",
-- 		},
-- 		opacity = 0.9,
-- 		width = "100%",
-- 		height = "100%",
-- 	},
-- }

config.keys = {
	{
		key = "LeftArrow",
		mods = "SUPER",
		action = wezterm.action.MoveTabRelative(-1),
	},
	{
		key = "RightArrow",
		mods = "SUPER",
		action = wezterm.action.MoveTabRelative(1),
	},
}

wezterm.time.call_after(600, function()
	wezterm.reload_configuration()
end)

return config
