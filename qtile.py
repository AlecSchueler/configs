import libqtile
from libqtile import manager as m
from libqtile import command as c
from libqtile import layout as l

m4    = "mod4"
spawn = "spawn"

K  = m.Key
C  = c._Call
S  = l.Stack

keys = [
    K( [m4,"shift"] ,"Return",
        C( spawn,"uxterm")),

    K( [m4],"w",
        C( spawn,"opera --notrayicon -private -nomail -nolirc")),

    K( [m4],"p",
        C( spawn,"dmenu_path | dmenu_run -nb white -nf black -sb goldenrod1 -sf black")),

    K( [m4], "m",
        C( spawn,"pidgin")),

    K( [m4], "n",
        C( spawn,"nicotine")),

    K( [m4], "a",
        C( spawn, "uxterm -e alsamixer")),

    K( [m4], "i",
        C( spawn, "idle")),

    K( [m4], "f",
        C( spawn, "firefox"))
    ]

groups = []
for i in range(1,10):groups.append(str(i))
for i in groups:
    K([m4], i, C("pullgroup", i))

layouts = [
    S(stacks=1),
    S(stacks=2)
    ]

##screens = [
##    libqtile.Screen(
##        bottom = libqtile.bar.Bar(
##                    [
##                        libqtile.bar.GroupBox(),
##                        libqtile.bar.WindowName()
##                    ],
##                    10,
##                ),
##    )
##    ]
