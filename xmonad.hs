import XMonad
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Layout.ThreeColumns
import XMonad.Hooks.SetWMName


myGoldenRod = "goldenrod1"
myBlack     = "black"
myWhite     = "white"

myDm = "dmenu_path | dmenu_run -nb white -nf black -sb goldenrod1 -sf black"
myBrowser = "opera -notrayicon -private -nomail -nolirc"


main = 
    xmonad $ defaultConfig
        { modMask            = mod4Mask
        , terminal           = "uxterm"
        , focusedBorderColor = "#94B4F2" --myGoldenRod
        , normalBorderColor  = "#345472"
        , layoutHook         = gaps [(D,9)] $ smartBorders $ layoutHook defaultConfig
        , startupHook        = setWMName "LG3D"
        }

    `additionalKeys`

    [ ((mod4Mask, xK_w),        spawn  myBrowser) 
    , ((mod4Mask, xK_Print),    spawn "uxterm")
    , ((mod4Mask, xK_i),        spawn "idle -e")
    , ((mod4Mask, xK_m),        spawn "pidgin")
    , ((mod4Mask, xK_v),        spawn "xterm -e python")
    , ((mod4Mask, xK_p),        spawn  myDm)
    , ((mod4Mask, xK_n),        spawn "nicotine -d")
    , ((mod4Mask, xK_a),        spawn "xterm -e alsamixer")
--  , ((mod4Mask, xK_l),        spawn "~/bin/lfmenu")
    , ((0,  0x1008ff12),        spawn "amixer -qc 0 set Master toggle")
    , ((0,  0x1008ff11),        spawn "amixer -qc 0 set Master 1dB-")
    , ((0,  0x1008ff13),        spawn "amixer -qc 0 set Master 2dB+")
    , ((mod4Mask .|. shiftMask, xK_Up),       spawn "xrandr -o normal")
    , ((mod4Mask .|. shiftMask, xK_Down),     spawn "xrandr -o inverted")
    , ((mod4Mask .|. shiftMask, xK_Left),     spawn "xrandr -o left")
    , ((mod4Mask .|. shiftMask, xK_Right),    spawn "xrandr -o right")
    , ((mod4Mask  , xK_x),      spawn "pysysstat")
    ]
