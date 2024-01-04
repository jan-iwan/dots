#!/bin/bash

riverctl float-filter-add app-id alacrittyf
riverctl float-filter-add app-id FloatingWindow
riverctl float-filter-add app-id rofi
riverctl float-filter-add app-id Gimp
riverctl float-filter-add app-id thunar
riverctl float-filter-add app-id pavucontrol
riverctl float-filter-add app-id virt-manager
riverctl float-filter-add app-id vimiv

riverctl float-filter-add title Telegram
riverctl float-filter-add title ""

# Set app-ids and titles of views which should use client side decorations
riverctl csd-filter-add app-id "firefox"
