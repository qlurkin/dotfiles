# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
import os
import subprocess
import socket
import netifaces as net

mod = "mod4"
alt = "mod1"

colors = {
	"foreground": "#ffffff",
	"background": "#182b3a",
	"cursor": "#f1c423",
	"black1": "#000000",
	"black2": "#555555", 
	"red1": "#ff0000",  
	"red2": "#ff638a",
	"green1": "#38de21", 
	"green2": "#41d720",
	"yellow1": "#ffe50a", 
	"yellow2": "#fec51e",
	"blue1": "#1460d2", 
	"blue2": "#0186fd",
	"magenta1": "#ff005d", 
	"magenta2": "#fa95ff",
	"cyan1": "#00bbbb", 
	"cyan2": "#7cfcfd",
	"white1": "#ffffff", 
	"white2": "#bbbbbb", 
	"bold": "#f7fcff"
}

# colors = {
# 	"foreground": "#ffffff",
# 	"background": "#132738", #182b3a
# 	"cursor": "#f0cc09", #f1c423
# 	"black1": "#000000",
# 	"black2": "#555555", #0051a2
# 	"red1": "#ff0000",  #ff638a
# 	"red2": "#f40e17",
# 	"green1": "#38de21", #41d720
# 	"green2": "#3bd01d",
# 	"yellow1": "#ffe50a", #fec51e
# 	"yellow2": "#edc809",
# 	"blue1": "#1460d2", #0186fd
# 	"blue2": "#5555ff",
# 	"magenta1": "#ff005d", #fa95ff
# 	"magenta2": "#ff55ff",
# 	"cyan1": "#00bbbb", #7cfcfd
# 	"cyan2": "#6ae3fa",
# 	"white1": "#bbbbbb", #ffffff
# 	"white2": "#ffffff", #bbbbbb
# 	"bold": "#f7fcff"
# }

def backlight(action):
	def f(qtile):
		brightness = int(subprocess.run(['xbacklight', '-get'],
										stdout=subprocess.PIPE).stdout)
		if brightness != 1 or action != 'dec':
			if (brightness > 49 and action == 'dec') \
								or (brightness > 39 and action == 'inc'):
				subprocess.run(['xbacklight', f'-{action}', '10',
								'-fps', '10'])
			else:
				subprocess.run(['xbacklight', f'-{action}', '1'])
	return f

keys = [
	# Switch between windows in current stack pane
	Key([mod], "Left",            lazy.layout.left()),
	Key([mod], "Right",           lazy.layout.right()),
	Key([mod], "Down",            lazy.layout.down()),
	Key([mod], "Up",              lazy.layout.up()),

	# Move windows up or down in current stack
	Key([mod, "shift"], "Left",   lazy.layout.swap_left()),
	Key([mod, "shift"], "Right",  lazy.layout.swap_right()),
	Key([mod, "shift"], "Down",   lazy.layout.shuffle_down()),
	Key([mod, "shift"], "Up",     lazy.layout.shuffle_up()),

	# Change windows size
	Key([mod], "equal",           lazy.layout.grow()),
	Key([mod], "minus",           lazy.layout.shrink()),
	Key([mod], "n",               lazy.layout.normalize()),
	Key([mod], "m",               lazy.layout.maximize()),

	# Apps
	Key([mod], "Return",          lazy.spawn("urxvt")),
	Key([mod], "c",               lazy.spawn("code")),
	Key([mod], "b",               lazy.spawn("chromium-browser --password-store=gnome")),
	Key([mod], "space",           lazy.spawn("rofi -show combi")),
	Key([mod], "l",               lazy.spawn("i3lock -i /home/ql/.config/qtile/lock.png -t")),
	#Key([mod], "l",               lazy.spawn("gnome-screensaver-command -l")),
	Key([], "Print",              lazy.spawn("scrot '%Y-%m-%d-%s_screenshot_$wx$h.jpg' -e 'mv $f ~/Pictures/'")),
	#Key([], "Print",              lazy.spawn("gnome-screenshot -i")),

	# Toggle between MonadTall and Max layout
	Key([mod], "f",               lazy.next_layout()),

	Key([mod], "w",               lazy.window.kill()),

	Key([mod, "shift"], "r",      lazy.restart()),
	Key([mod, "shift"], "e",      lazy.shutdown()),
	#Key([mod, "shift"], "q",      lazy.spawn('gnome-session-quit --logout --no-prompt')),
	#Key([mod], "agrave", lazy.spawn('gnome-session-quit --power-off')),
	Key([mod], "r",               lazy.spawncmd()),

	# Cycle throught groups
	Key([alt], "Tab",             lazy.screen.toggle_group()),
	Key([alt], "Right",           lazy.screen.next_group()),
	Key([alt], "Left",            lazy.screen.prev_group()),


	# Sound control
	Key([], "XF86AudioRaiseVolume",  lazy.spawn("pactl set-sink-volume 0 +5%")),
	Key([], "XF86AudioLowerVolume",  lazy.spawn("pactl set-sink-volume 0 -5%")),
	Key([], "XF86AudioMute",         lazy.spawn("pactl set-sink-mute 0 toggle")),

	# Monitor Brightness control
	Key([], "XF86MonBrightnessUp",   lazy.function(backlight('inc'))),
	Key([], "XF86MonBrightnessDown", lazy.function(backlight('dec'))),

	# Projector
	#Key([mod], "p",               lazy.spawn("xrandr --output HDMI-1-2 --auto --same-as eDP-1-1")),
	
	#Key([mod], "x", lazy.spawn("urxvt -e cmatrix"))
]

group_names = "123456789"
group_keys = [
	"ampersand",
	"eacute",
	"quotedbl",
	"apostrophe",
	"parenleft",
	"section",
	"egrave",
	"exclam",
	"ccedilla"
]

groups = [Group(i) for i in group_names]

for name, key in zip(group_names, group_keys):
	keys.append(Key([mod], key, lazy.group[name].toscreen()))
	keys.append(Key([mod, "shift"], key, lazy.window.togroup(name)))

layouts = [
	layout.MonadTall(ratio=0.6, single_border_width=2, border_focus=colors["magenta1"]),
	layout.Max()
]

def netInfo(interface):
	def fun():
		if interface not in net.interfaces():
			return 'no interfaces named {}'.format(interface)
		adresses = net.ifaddresses(interface)

		if net.AF_INET not in adresses:
			return 'down'

		address = net.ifaddresses(interface)[net.AF_INET][0]['addr']
		return address
	return fun

bar_widgets = [
	{
		"widget": widget.GroupBox(padding=3)
	},
	{
		"separator": "right",
		"widget": widget.CurrentLayout(),
		"background": colors["magenta1"],
		"foreground":colors["foreground"]
	},
	{
		"separator": "right",
		"widget": widget.Prompt(prompt="{0}@{1}: ".format(os.environ["USER"], socket.gethostname()))
	},
	{
		"widget": widget.WindowName()
	},
	{
		"widget": widget.Systray()
	},
	{
		"widget": widget.TextBox(text=' ', padding=0)
	},
	{
		"separator": "left",
		"widget": widget.Battery(battery_name="BAT1", charge_char="", discharge_char=""),
		"background": colors["yellow1"],
		"foreground": colors["background"],
		"icon": "\uf584"
	},
	{
		"widget": widget.Battery(battery_name="BAT0", charge_char="", discharge_char=""),
		"background": colors["yellow1"],
		"foreground": colors["background"],
		"icon": "\uf583"
	},
	{
		"separator": "left",
		"widget": widget.GenPollText(func=netInfo('wlp3s0'), update_interval=10),
		"background": colors["magenta1"],
		"foreground":colors["foreground"],
		"icon": "\uf1eb"
	},
	{
		"widget": widget.GenPollText(func=netInfo('enp0s31f6'), update_interval=10),
		"background": colors["magenta1"],
		"foreground":colors["foreground"],
		"icon": "\uf6ff"
	},
	{
		"separator": "left",
		"widget": widget.Volume(),
		"background": colors["blue1"],
		"foreground": colors["foreground"],
		"icon": "\uf028"
	},
	{
		"separator": "left",
		"widget": widget.Clock(format='%d-%m-%Y %a %H:%M'),
		"background": colors["white2"],
		"foreground": colors["black1"],
		"icon": "\uf017"
	}
]

powerline_left_colors = []

powerline_right_colors = [
	{"background": colors["white1"], "foreground": colors["black1"]},
	{"background": colors["cyan1"], "foreground": colors["black1"]},
	{"background": colors["magenta1"], "foreground":colors["white2"]},
	{"background": colors["blue2"], "foreground": colors["white2"]},
	{"background": colors["yellow1"], "foreground": colors["background"]}
]

def make_powerline(widgets):
	res = []
	prevBackground = None
	background = colors["background"]
	foreground = colors["foreground"]

	for segment in widgets:
		if "background" in segment:
			background = segment["background"]
		else:
			background = colors["background"]
			
		if "foreground" in segment:
			foreground = segment["foreground"]
		else:
			foreground = colors["foreground"]

		if "separator" in segment:
			if segment["separator"] == "left":
				res.append(widget.TextBox(text='', fontsize=28, background=prevBackground, foreground=background, padding=-1))
			else:
				res.append(widget.TextBox(text='', fontsize=28, foreground=prevBackground, background=background, padding=-1))

		if "icon" in segment:
			res.append(widget.TextBox(text=segment['icon'], fontsize=20, foreground=foreground, background=background, padding=3))

		w = segment["widget"]
		w.background = background
		prevBackground = background
		w.foreground = foreground

		res.append(w)
		
	return res

widget_defaults = dict(
	font='Mononoki Nerd Font',
	fontsize=16,
	padding=10,
	background=colors["background"]
)

screens = [
	Screen(bottom=bar.Bar(make_powerline(bar_widgets), 30)),
	Screen(bottom=bar.Bar([widget.GroupBox()], 30))
]

# Drag floating layouts.
mouse = [
	Drag([mod], "Button1", lazy.window.set_position_floating(),
		start=lazy.window.get_position()),
	Drag([mod], "Button3", lazy.window.set_size_floating(),
		start=lazy.window.get_size()),
	Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating()
auto_fullscreen = True
focus_on_window_activation = "smart"
extentions = []

wmname = 'qtile'

subprocess.call('xrandr --output HDMI-1-2 --auto --right-of eDP-1-1'.split(' '))

@hook.subscribe.startup_once
def start_once():
	home = os.path.expanduser('~')
	subprocess.call([home + '/.config/qtile/autostart.sh'])

@hook.subscribe.screen_change
def restart_on_randr(qtile, ev):
	qtile.cmd_restart()
