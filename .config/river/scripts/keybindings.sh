#!/bin/bash

riverctl map normal  Super        Return    spawn alacritty
riverctl map normal  Super+Shift  Return    spawn "alacritty --class alacrittyf,alacrittyf"
riverctl map normal  Super        P         spawn "rofi -show drun -show-icons"
riverctl map normal  Super        O         spawn "rofi -show run"

riverctl map normal  Super          A       spawn "firefox"
riverctl map normal  Super          S       spawn "firefox -P $my_firefox_profile"
riverctl map normal  Super          E       spawn "thunar"
riverctl map normal  Super          A       spawn "firefox"
riverctl map normal Super Q spawn "killall waybar; waybar"


riverctl map normal  Super        C         close
riverctl map normal  Super+Shift  Q         exit
riverctl map normal  Super+Shift  End       spawn "poweroff"
riverctl map normal  Super+Shift  Home      spawn "reboot"
riverctl map normal  Super+Control End      spawn "systemctl hibernate"
riverctl map normal  Super+Control Home     spawn "systemctl suspend"
riverctl map normal  Super+Control Pause    spawn "systemctl hybrid-sleep"

riverctl map -repeat normal Super        J focus-view next
riverctl map -repeat normal Super        K focus-view previous
riverctl map normal  Super+Shift  J swap next
riverctl map normal  Super+Shift  K swap previous

riverctl map -repeat normal Super        H send-layout-cmd rivertile "main-ratio -0.05"
riverctl map -repeat normal Super        L send-layout-cmd rivertile "main-ratio +0.05"
riverctl map normal  Super+Shift  H send-layout-cmd rivertile "main-count +1"
riverctl map normal  Super+Shift  L send-layout-cmd rivertile "main-count -1"

riverctl map normal  Super        Tab focus-previous-tags
riverctl map normal  Super+Shift  Tab send-to-previous-tags

riverctl map normal  Super        W focus-output next
riverctl map normal  Super+Shift  W send-to-output next

riverctl map normal  Super Z zoom


# move views
riverctl map normal  Super+Alt          H move left 100
riverctl map normal  Super+Alt          J move down 100
riverctl map normal  Super+Alt          K move up 100
riverctl map normal  Super+Alt          L move right 100
riverctl map-pointer normal Super BTN_LEFT move-view

# snap views to screen edges
riverctl map normal  Super+Alt+Control  H snap left
riverctl map normal  Super+Alt+Control  J snap down
riverctl map normal  Super+Alt+Control  K snap up
riverctl map normal  Super+Alt+Control  L snap right

# resize views
riverctl map normal  Super+Alt+Shift    H resize horizontal -100
riverctl map normal  Super+Alt+Shift    J resize vertical 100
riverctl map normal  Super+Alt+Shift    K resize vertical -100
riverctl map normal  Super+Alt+Shift    L resize horizontal 100
riverctl map-pointer normal Super BTN_RIGHT resize-view


for i in $(seq 1 9)
do
    tags=$((1 << ($i - 1)))

    # focus tag [0-8]
    riverctl map normal  Super $i set-focused-tags $tags

    # tag focused view with tag [0-8]
    riverctl map normal  Super+Shift $i set-view-tags $tags

    # toggle focus of tag [0-8]
    riverctl map normal  Super+Control $i toggle-focused-tags $tags

    # toggle tag [0-8] of focused view
    riverctl map normal  Super+Shift+Control $i toggle-view-tags $tags
done

# tag focused view with all tags
all_tags=$(((1 << 32) - 1))
riverctl map normal  Super 0 set-focused-tags $all_tags
riverctl map normal  Super+Shift 0 set-view-tags $all_tags

riverctl map normal  Super T toggle-float

riverctl map normal  Super Space toggle-fullscreen

riverctl declare-mode           passthrough
riverctl map normal  Super                      F11 enter-mode passthrough
riverctl map passthrough Super                  F11 enter-mode normal


riverctl map -repeat normal None        XF86AudioRaiseVolume  spawn 'amixer -D pipewire set Master 5%+'
riverctl map -repeat normal None        XF86AudioLowerVolume  spawn 'amixer -D pipewire set Master 5%-'
riverctl map normal  None        XF86AudioMute         spawn 'amixer -D pipewire set Master toggle'

riverctl map -repeat normal Super+Shift XF86AudioRaiseVolume  spawn 'mpc -q volume +5'
riverctl map -repeat normal Super+Shift XF86AudioLowerVolume  spawn 'mpc -q volume +5-'
riverctl map normal  Super+Shift XF86AudioRaiseVolume  spawn 'mpc next -q'
riverctl map normal  Super+Shift XF86AudioLowerVolume  spawn 'mpc next -q'
riverctl map normal  Super       Slash                 spawn 'mpc toggle -q'
#riverctl map normal  Super       S                     spawn 'mpc toggle -q'
riverctl map normal  Super+Shift XF86AudioMute         spawn 'mpc stop -q'
