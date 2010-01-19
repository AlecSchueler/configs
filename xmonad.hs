import XMonad
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Layout.ThreeColumns
import XMonad.Hooks.SetWMName
import XMonad.Config.Xfce


myDm = "dmenu_path | dmenu_run -nb white -nf black -sb goldenrod1 -sf black"
myBrowser = "opera -notrayicon"

main =
    xmonad $ xfceConfig 
        { modMask            = mod4Mask
        , terminal           = "xfce4-terminal"
        , focusedBorderColor = "#535353"
        , normalBorderColor  = "#222222"
        , borderWidth        = 1
        , layoutHook         = gaps [(U,10)] $ smartBorders $ layoutHook defaultConfig
        , startupHook        = setWMName "LG3D"
        }

    `additionalKeys`

    [ ((mod4Mask, xK_w),        spawn  myBrowser)
    , ((mod4Mask, xK_Print),    spawn "exec xfce4-terminal")
    , ((mod4Mask, xK_i),        spawn "idle -e")
    , ((mod4Mask, xK_m),        spawn "exec pidgin")
    , ((mod4Mask, xK_v),        spawn "exev xterm -e python")
    , ((mod4Mask, xK_p),        spawn  myDm)
    , ((mod4Mask, xK_n),        spawn "exec nicotine -d")
    , ((mod4Mask, xK_s),        spawn "exec /home/john/bin/dpms_toggle")
    , ((mod4Mask, xK_a),        spawn "exec xterm -e alsamixer")
    , ((0,  0x1008ff12),        spawn "amixer -qc 0 set Master toggle")
    , ((0,  0x1008ff11),        spawn "amixer -qc 0 set Master 1dB-")
    , ((0,  0x1008ff13),        spawn "amixer -qc 0 set Master 2dB+")
    , ((mod4Mask .|. shiftMask, xK_Up),       spawn "xrandr -o normal")
    , ((mod4Mask .|. shiftMask, xK_Down),     spawn "xrandr -o inverted")
    , ((mod4Mask .|. shiftMask, xK_Left),     spawn "xrandr -o left")
    , ((mod4Mask .|. shiftMask, xK_Right),    spawn "xrandr -o right")
    , ((mod4Mask, xK_x),      spawn "pysysstat")
    , ((mod4Mask, xK_f),       sendMessage $ ToggleGap U)
    ]

