import XMonad


import XMonad.Actions.NoBorders

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Layout.Dwindle
import XMonad.Layout.Grid
import XMonad.Layout.Spacing
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import qualified XMonad.Layout.NoBorders as BO

import XMonad.ManageHook

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
--import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Actions.CycleWS 


-- Pretty Print
myPP :: PP
myPP = def
    { ppSep             = magenta " : "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = yellow . wrap " " "" . xmobarBorder "Bottom width=1 mb=1" "#d65d0e" 1
    , ppHidden          = foreground . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = xmobarBorder "Bottom width=1 mb=1" "#d65d0e" 1 . wrap (yellow "{") (yellow "}") . yellow . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . lowWhite . ppWindow
    
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 32

    foreground, blue, lowWhite, magenta, red, white, yellow :: String -> String
    foreground = xmobarColor "#d5c4a1" ""
    magenta  = xmobarColor   "#b16282" ""
    blue     = xmobarColor   "#458588" ""
    white    = xmobarColor   "#83a598" ""
    yellow   = xmobarColor   "#d79921" ""
    red      = xmobarColor   "#cc241d" ""
    lowWhite = xmobarColor   "#a89984" ""



myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "Gimp"               --> doFloat
    , className =? "vlc"                --> doFloat
    , className =? "TelegramDesktop"    --> doFloat
    , className =? "Spotify"            --> doFloat
    , className =? "VirtualBox Manager" --> doFloat
    , className =? "Virt-manager"       --> doFloat
    , className =? "alacrittyf"         --> doFloat
    , className =? "Thunar"             --> doFloat
    , className =? "Helm"               --> doFloat
    , className =? "FloatingWindow"     --> doFloat
    , className =? ""                   --> doFloat
    ]



myLayout = BO.lessBorders BO.Never $ (tiled ||| full)
  where
    tiled   = renamed [Replace "[]"] $ smartSpacing 2 $ Tall nmaster delta ratio
    nmaster = 1      -- Default number of windows in the master pane
    ratio   = 1/2    -- Default proportion of screen occupied by master pane
    delta   = 3/100  -- Percent of screen to increment by when resizing panes

    full = renamed [Replace "{}"] $  BO.noBorders (Full)

-- xmobar on second monitor
myStartupHook = do
    spawnOnce "xmobar $HOME/.config/xmobar/xmobarrc2 -x 1"

myConfig = def
    { modMask = mod4Mask                    -- Rebind Mod to the Super key
    ,   layoutHook          = myLayout      -- Use custom layouts
    ,   manageHook          = myManageHook  -- Match on certain windows
    ,   startupHook         = myStartupHook
    ,   terminal            = "alacritty"
    ,   normalBorderColor   = "#263640"
    ,   focusedBorderColor  = "#458588"
    ,   borderWidth         = 1
    }

    `additionalKeysP`
    [ ("M-<L>",             prevWS)
    , ("M-<R>",             nextWS)
    , ("M-S-<L>",           shiftToPrev)
    , ("M-S-<R>",           shiftToNext)
    , ("M-<Tab>",           toggleWS)
    , ("M-c",               kill)
    , ("M-<Return>",        spawn "alacritty")
    , ("M-e",               spawn "alacritty")
    , ("M-S-<Return>",      spawn "alacritty --class alacrittyf,alacrittyf")
    , ("M-S-e",             spawn "alacritty --class alacrittyf,alacrittyf")
    , ("M-p",               spawn "rofi -show drun -show-icons")
    , ("M-o",               spawn "rofi -show run")

    , ("M-v",               withFocused toggleBorder)

    , ("M-w",               nextScreen)
    , ("M-S-w",             shiftNextScreen)

    , ("M-C-j",             prevScreen)
    , ("M-C-k",             nextScreen)
    , ("M-C-S-j",           shiftPrevScreen)
    , ("M-C-S-k",           shiftNextScreen)
    , ("M-C-h",             swapPrevScreen)
    , ("M-C-l",             swapNextScreen)


    , ("M-a a",             spawn "firefox")
    , ("M-a s",             spawn "firefox -P $my_firefox_profile")
    , ("M-a d",             spawn "telegram")
    , ("M-a e",             spawn "thunar")
    , ("M-a x",             spawn "alacritty -e ranger")
    , ("M-a w",             spawn "vlc")
    , ("M-a q",             spawn "spotifyd -b pulseaudio")
    , ("M-a r",             spawn "discord")
    , ("M-a f",             spawn "helm")
    , ("M-a v",             spawn "alacritty -e btop")
    , ("M-a z",             spawn "alacritty -e vi")
    , ("M-a c",             spawn "alacritty -e ncmpcpp")
    , ("M-a S-v",           spawn "alacritty -e btop")
    , ("M-a S-z",           spawn "alacritty -e vi")
    , ("M-a S-c",           spawn "alacritty --class alacrittyf,alacrittyf -e ncmpcpp -s visualizer")
    , ("M-a S-a",           spawn "gimp")
    , ("M-a S-s",           spawn "virt-manager")
    , ("M-a S-d",           spawn "PIPEWIRE_LATENCY='128/48000' pw-jack reaper")
    , ("M-a n",             spawn "alacritty --class alacrittyf,alacrittyf -e qalc")
    , ("<XF86Calculator>",  spawn "alacritty --class alacrittyf,alacrittyf -e qalc")

    , ("<Print>",           spawn "maim -i $(xdotool getwindowfocus) $HOME/Pictures/Screenshots/$(date +%F-%T).png")
    , ("S-<Print>",         spawn "maim -s $HOME/Pictures/Screenshots/$(date +%F-%T).png")
    , ("M-<Print>",         spawn "maim $HOME/Pictures/Screenshots/$(date +%F-%T).png")
    , ("<XF86AudioRaiseVolume>",        spawn "amixer -D pipewire set Master 5%+")
    , ("<XF86AudioLowerVolume>",        spawn "amixer -D pipewire set Master 5%-")
    , ("<XF86AudioMute>",               spawn "amixer -D pipewire set Master toggle")
    , ("M-<XF86AudioRaiseVolume>",      spawn "mpc -q volume +5")
    , ("M-<XF86AudioLowerVolume>",      spawn "mpc -q volume -5")
    , ("M-S-<XF86AudioRaiseVolume>",    spawn "mpc next -q")
    , ("M-S-<XF86AudioLowerVolume>",    spawn "mpc prev -q")
    , ("M-<XF86AudioMute>",     spawn "mpc stop -q")
    , ("M-/",                   spawn "mpc toggle -q")
    , ("M-s",                   spawn "mpc toggle -q")
    , ("M-r",                   spawn "pkill -USR1 redshift")
 
    , ("M-S-<End> <Return>",    spawn "poweroff")
    , ("M-S-<Home> <Return>",   spawn "reboot")
    , ("M-C-<End> <Return>",    spawn "systemctl hibernate")
    , ("M-C-<Home> <Return>",   spawn "systemctl suspend")
    , ("M-C-<Pause> <Return>",  spawn "systemctl hybrid-sleep")
   ]

--    `removeKeysP`
--    [ ("M-e")
--    ]


main :: IO ()
main = xmonad
    . ewmhFullscreen
    . ewmh
--    . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
    . withEasySB mySB defToggleStrutsKey
    $ myConfig

mySB = statusBarProp "xmobar" (pure myPP)
