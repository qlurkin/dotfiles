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

# Start Keyring for Chrome Passwords Sync
lazy.spawn("/usr/bin/gnome-keyring-daemon --start --components=secrets")

mod = "mod4"
alt = "mod1"

keys = [
    # Switch between windows in current stack pane
    Key(
        [mod], "Left",
        lazy.layout.left()
    ),
    Key(
        [mod], "Right",
        lazy.layout.right()
    ),
    Key(
        [mod], "Down",
        lazy.layout.down()
    ),
    Key(
        [mod], "Up",
        lazy.layout.up()
    ),

    # Move windows up or down in current stack
    Key(
        [mod, "shift"], "Left",
        lazy.layout.swap_left()
    ),
    Key(
        [mod, "shift"], "Right",
        lazy.layout.swap_right()
    ),
    Key(
        [mod, "shift"], "Down",
        lazy.layout.shuffle_down()
    ),
    Key(
        [mod, "shift"], "Up",
        lazy.layout.shuffle_up()
    ),

    # Change windows size
    Key(
        [mod], "equal",
        lazy.layout.grow()
    ),
    Key(
        [mod], "minus",
        lazy.layout.shrink()
    ),
    Key(
        [mod], "n",
        lazy.layout.normalize()
    ),
    Key(
        [mod], "m",
        lazy.layout.maximize()
    ),

    # Apps
    Key([mod], "Return", lazy.spawn("urxvt")),
    Key([mod], "b", lazy.spawn("google-chrome --password-store=gnome")),

    # Toggle between MonadTall and Max layout
    Key([mod], "f", lazy.next_layout()),

    Key([mod], "w", lazy.window.kill()),

    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "shift"], "e", lazy.shutdown()),
    Key([mod], "r", lazy.spawncmd())
]

#groups = [Group(i) for i in "asdfuiop"]

#for i in groups:
#    # mod1 + letter of group = switch to group
#    keys.append(
#        Key([mod], i.name, lazy.group[i.name].toscreen())
#    )
#
#    # mod1 + shift + letter of group = switch to & move focused window to group
#    keys.append(
#        Key([mod, "shift"], i.name, lazy.window.togroup(i.name))
#    )

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

keys += [
    # Key([mod], "ampersand", lazy.group["1"].toscreen()),        
    # Key([mod], "eacute", lazy.group["2"].toscreen()),
    # Key([mod], "quotedbl", lazy.group["3"].toscreen()),
    # Key([mod], "apostrophe", lazy.group["4"].toscreen()),
    # Key([mod], "parenleft", lazy.group["5"].toscreen()),
    # Key([mod], "section", lazy.group["6"].toscreen()),
    # Key([mod], "egrave", lazy.group["7"].toscreen()),
    # Key([mod], "exclam", lazy.group["8"].toscreen()),
    # Key([mod], "ccedilla", lazy.group["9"].toscreen()),

    # Cycle throught groups
    Key([alt], "Tab", lazy.screen.next_group()),
    Key([alt, "shift"], "Tab", lazy.screen.prev_group())
]


layouts = [
    layout.MonadTall(ratio=0.6, single_border_width=2),
    layout.Max()
]

widget_defaults = dict(
    font='Mononoki',
    fontsize=16,
    padding=3,
)

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.TextBox("default config", name="default"),
                widget.Systray(),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
            ],
            30,
        ),
    ),
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

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

