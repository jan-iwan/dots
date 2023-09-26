#!/bin/bash

# simple macros

map() {
    riverctl map normal "$@"
}
mapr() {
    riverctl map -repeat normal "$@" 
}
mapp() {
    riverctl map-pointer normal "$@" 
}

### views (windows) ###

map  Super C                close
map  Super+Shift Q          exit

map  Super J                focus-view next
map  Super K                focus-view previous
map  Super+Shift J          swap next
map  Super+Shift K          swap previous

map  Super Tab              focus-previous-tags
map  Super+Shift Tab        send-to-previous-tags

map  Super U                focus-output next
map  Super+Shift U          send-to-output next

map  Super T                toggle-float
map  Super Space            toggle-fullscreen

# move
mapr Super+Alt H            move left 100
mapr Super+Alt J            move down 100
mapr Super+Alt K            move up 100
mapr Super+Alt L            move right 100
mapp Super BTN_LEFT         move-view

# snap to screen edges
map  Super+Shift+Alt H      snap left
map  Super+Shift+Alt J      snap down
map  Super+Shift+Alt K      snap up
map  Super+Shift+Alt L      snap right

# resize views
mapr Super+Control H        resize horizontal -100
mapr Super+Control J        resize vertical 100
mapr Super+Control K        resize vertical -100
mapr Super+Control L        resize horizontal 100
mapp Super BTN_RIGHT        resize-view

# map  Super Z                zoom

### layout ###

mapr Super H                send-layout-cmd rivertile "main-ratio -0.05"
mapr Super L                send-layout-cmd rivertile "main-ratio +0.05"
map  Super+Shift H          send-layout-cmd rivertile "main-count +1"
map  Super+Shift L          send-layout-cmd rivertile "main-count -1"

### tags ###

# map Super i with i = 1, ..., 9
for i in $(seq 1 9)
do
    tags=$((1 << ($i - 1)))

    # focus tag [0-8]
    map Super $i            set-focused-tags $tags

    # tag focused view with tag [0-8]
    map Super+Shift $i      set-view-tags $tags

    # toggle focus of tag [0-8]
    map Super+Control $i    toggle-focused-tags $tags

    # toggle tag [0-8] of focused view
    map Super+Shift+Control $i toggle-view-tags $tags
done

# tag focused view with all tags
all_tags=$(((1 << 32) - 1))
map  Super 0                set-focused-tags $all_tags
map  Super+Shift 0          set-view-tags $all_tags

riverctl declare-mode       passthrough
map  Super F11 enter-mode   passthrough
riverctl map passthrough Super F11 enter-mode normal


### apps ###

# don't like these ones
map  Super+Shift End        spawn "poweroff"
map  Super+Shift Home       spawn "reboot"
map  Super+Control End      spawn "systemctl hibernate"
map  Super+Control Home     spawn "systemctl suspend"
map  Super+Control Pause    spawn "systemctl hybrid-sleep"

map  Super Return           spawn "alacritty"
map  Super+Shift Return     spawn "alacritty --class alacrittyf,alacrittyf"
map  Super A                spawn "rofi -show drun -show-icons -monitor -1"
map  Super P                spawn "rofi -show run -monitor -1"

map  Super W                spawn "firefox"
map  Super E                spawn "firefox -P $my_firefox_profile"
map  Super Q                spawn "killall waybar; waybar"

# volume
mapr None XF86AudioRaiseVolume  spawn "amixer -D pipewire set Master 5%+"
mapr None XF86AudioLowerVolume  spawn "amixer -D pipewire set Master 5%-"
map  None XF86AudioMute         spawn "amixer -D pipewire set Master toggle"

mapr Super+Shift XF86AudioRaiseVolume  spawn "mpc -q volume +5"
mapr Super+Shift XF86AudioLowerVolume  spawn "mpc -q volume +5-"
map  Super+Shift XF86AudioRaiseVolume  spawn "mpc next -q"
map  Super+Shift XF86AudioLowerVolume  spawn "mpc next -q"
map  Super       Slash                 spawn "mpc toggle -q"
map  Super+Shift XF86AudioMute         spawn "mpc stop -q"
