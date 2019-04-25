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

mod = "mod4"
alt = "mod1"

colors = {
    "foreground": "#ffffff",
    "background": "#132738",
    "cursor": "#f0cc09",
    "black1": "#000000",
    "black2": "#555555",
    "red1": "#ff0000",
    "red2": "#f40e17",
    "green1": "#38de21",
    "green2": "#3bd01d",
    "yellow1": "#ffe50a",
    "yellow2": "#edc809",
    "blue1": "#1460d2",
    "blue2": "#5555ff",
    "magenta1": "#ff005d",
    "magenta2": "#ff55ff",
    "cyan1": "#00bbbb",
    "cyan2": "#6ae3fa",
    "white1": "#bbbbbb",
    "white2": "#ffffff",
    "bold": "#f7fcff"
}

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

def projection():
    proj_modes = [
        "xrandr --output HDMI-1-2 --off",
        "xrandr --output HDMI-1-2 --auto --right-of eDP-1-1",
        "xrandr --output HDMI-1-2 --auto --same-as eDP-1-1"
    ]

    proj_mode_index = 0

    def f(qtile):
        nonlocal proj_mode_index
        proj_mode_index = (proj_mode_index+1) % len(proj_modes)
        subprocess.run(proj_modes[proj_mode_index].split(' '))

    return f

def matrix():
    def f(qtile):
        pass
        #subprocess.call("urxvt -e cmatrix".split())

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
    Key([mod], "b",               lazy.spawn("google-chrome --password-store=gnome")),
    Key([mod], "space",           lazy.spawn("rofi -show combi")),
    Key([mod], "l",               lazy.spawn("i3lock -c 132738")),

    # Toggle between MonadTall and Max layout
    Key([mod], "f",               lazy.next_layout()),

    Key([mod], "w",               lazy.window.kill()),

    Key([mod, "shift"], "r",      lazy.restart()),
    Key([mod, "shift"], "e",      lazy.shutdown()),
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
    Key([mod], "p",               lazy.spawn("xrandr --output HDMI-1-2 --auto --same-as eDP-1-1")),
    
    Key([mod], "x", lazy.spawn("urxvt -e cmatrix"))
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
    layout.MonadTall(ratio=0.6, single_border_width=2),
    layout.Max()
]

#groups.append(
#    ScratchPad("scratchpad", [
#

widget_defaults = dict(
    font='Mononoki',
    fontsize=16,
    padding=3,
    background=colors["background"]
)
powerline = 28
icon = 20
screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.GroupBox(),
                widget.TextBox(text='  ', fontsize=powerline),
                widget.Prompt(prompt="{0}@{1}: ".format(os.environ["USER"], socket.gethostname())),
                widget.WindowName(),
                widget.TextBox(text=' ', fontsize=powerline, foreground=colors["white1"], padding=-1),
                widget.TextBox(text='\uf240', fontsize=icon, background=colors["white1"], foreground=colors["background"], padding=0, font="Font Awesome"),
                widget.Battery(battery_name="BAT1", charge_char="", discharge_char="", background=colors["white1"], foreground=colors["background"]),
                widget.TextBox(text='', fontsize=powerline, background=colors["white1"], foreground=colors["background"]),
                widget.TextBox(text='\uf240', fontsize=icon, background=colors["white1"], foreground=colors["background"], padding=0, font="Font Awesome"),
                widget.Battery(battery_name="BAT0", charge_char="", discharge_char="", background=colors["white1"], foreground=colors["background"]),
                widget.TextBox(text='', fontsize=powerline, background=colors["white1"], foreground=colors["background"], padding=-1),
                widget.TextBox(text='\uf1eb', fontsize=icon, foreground=colors["white1"], padding=0, font="Font Awesome"),
                widget.Net(interface='wlp3s0'),
                widget.TextBox(text=' ', fontsize=powerline, foreground=colors["white1"], padding=-1),
                widget.TextBox(text='\uf028', fontsize=icon, background=colors["white1"], foreground=colors["background"], padding=0, font="Font Awesome"),
                widget.Volume(background=colors["white1"], foreground=colors["black1"], padding=10),
                widget.TextBox(text='', fontsize=powerline, background=colors["white1"], foreground=colors["background"], padding=-1),
                widget.TextBox(text=' ', fontsize=powerline, foreground=colors["white1"], padding=-1),
                widget.Systray(),
                widget.TextBox(text=' ', fontsize=powerline, foreground=colors["white1"], padding=-1),
                widget.TextBox(text='\uf017', fontsize=icon, background=colors["white1"], foreground=colors["background"], padding=0, font="Font Awesome"),
                widget.Clock(format='%d-%m-%Y %a %H:%M', background=colors["white1"], foreground=colors["black1"], padding=10),
            ],
            30,
        ),
        right=bar.Gap(0)
    ),
    Screen(bottom=bar.Bar([widget.GroupBox()],30))
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

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, github issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
#wmname = "LG3D"
wmname = 'qtile'

subprocess.call('xrandr --output HDMI-1-2 --auto --right-of eDP-1-1'.split(' '))

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

@hook.subscribe.screen_change
def restart_on_randr(qtile, ev):
    qtile.cmd_restart()

