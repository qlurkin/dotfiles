local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Dracula (Official)"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
-- config.enable_kitty_keyboard = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = true
config.integrated_title_button_style = "MacOsNative"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 1.0,
}

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
	{
		key = "|",
		mods = "SUPER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "_",
		mods = "SUPER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "s",
		mods = "SUPER",
		action = wezterm.action.SendKey({
			key = "s",
			mods = "CTRL",
		}),
	},
}

config.tab_max_width = 64

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick

function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

local theme = wezterm.color.get_builtin_schemes()[config.color_scheme]

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = theme.tab_bar.background

	-- inactive tabs
	local background = wezterm.color.parse(edge_background):lighten(0.15)
	local foreground = theme.tab_bar.inactive_tab.fg_color
	local index_bg = theme.tab_bar.inactive_tab_hover.bg_color
	local index_fg = theme.tab_bar.inactive_tab_hover.fg_color

	if tab.is_active then
		background = theme.tab_bar.inactive_tab_hover.bg_color
		foreground = theme.tab_bar.inactive_tab_hover.fg_color
		index_bg = theme.tab_bar.active_tab.bg_color
		index_fg = theme.tab_bar.active_tab.fg_color
	elseif hover then
		background = theme.tab_bar.inactive_tab_hover.bg_color
		foreground = theme.tab_bar.inactive_tab_hover.fg_color
		index_bg = theme.tab_bar.inactive_tab_hover.bg_color
		index_fg = theme.tab_bar.inactive_tab_hover.fg_color
	end

	local edge_foreground = background

	local title = tab_title(tab)
	local index = tab.tab_index + 1

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = index_bg } },
		{ Text = " " .. SOLID_LEFT_ARROW },
		{ Background = { Color = index_bg } },
		{ Foreground = { Color = index_fg } },
		{ Text = "" .. index .. " " },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = " " .. title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

-- wezterm.on("update-right-status", function(window, pane)
-- 	local date = wezterm.strftime("%Y-%m-%d %H:%M:%S")
--
-- 	-- Make it italic and underlined
-- 	window:set_right_status(wezterm.format({
-- 		{ Attribute = { Underline = "Single" } },
-- 		{ Attribute = { Italic = true } },
-- 		{ Text = "Hello " .. date },
-- 	}))
-- end)

wezterm.time.call_after(600, function()
	wezterm.reload_configuration()
end)

return config
