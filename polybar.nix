{ config,lib, pkgs, ... }:

{
	services.polybar = {
		enable = true;
		extraConfig= ''
			[colors]
base = #1e1e2e
mantle = #181825
crust = #11111b
text = #cdd6f4
subtext0 = #a6adc8
subtext1 = #bac2de
surface0 = #313244
surface1 = #45475a
surface2 = #585b70
overlay0 = #6c7086
overlay1 = #7f849c
overlay2 = #9399b2
blue = #89b4fa
lavender = #b4befe
sapphire = #74c7ec
sky = #89dceb
teal = #94e2d5
green = #a6e3a1
yellow = #f9e2af
peach = #fab387
maroon = #eba0ac
red = #f38ba8
mauve = #cba6f7
pink = #f5c2e7
flamingo = #f2cdcd
rosewater = #f5e0dc
transparent = #FF00000

;==========================================================
;
;
;   ██████╗  ██████╗ ██╗  ██╗   ██╗██████╗  █████╗ ██████╗
;   ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
;   ██████╔╝██║   ██║██║   ╚████╔╝ ██████╔╝███████║██████╔╝
;   ██╔═══╝ ██║   ██║██║    ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗
;   ██║     ╚██████╔╝███████╗██║   ██████╔╝██║  ██║██║  ██║
;   ╚═╝      ╚═════╝ ╚══════╝╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
;
;
;   To learn more about how to configure Polybar
;   go to https://github.com/polybar/polybar
;
;   The README contains a lot of information
;
;==========================================================

[colors]
; background = ${colors.base}
background = #bb1e1e2e
background-alt = ${colors.blue}
foreground = ${colors.text}
primary = ${colors.mauve}
secondary = ${colors.mantle}
alert = ${colors.red}
disabled = ${colors.subtext1}

[bar/toph]
monitor = ${env:MONITOR:}
width = 100%
height = 28pt
radius = 0

; dpi = 96

background = ${colors.background}
foreground = ${colors.foreground}

bottom = false 

line-size = 6pt

#border-size = 4pt
border-color = #00000000

padding-left = 0
padding-right = 1

module-margin = 1

separator = |
separator-foreground = ${colors.flamingo}

;default font
font-0 = MesloLGS Nerd Font Mono:size=14;2

;wifi font
font-1 = MesloLGS Nerd Font Mono:size=20;3 

font-2 = Font Awesome 6 Free:pixelsize=12;2
font-3 = Font Awesome 6 Free Solid:pixelsize=12;2
font-4 = Font Awesome 6 Brands:pixelsize=12;2
; tray-position = right 

modules-left = xworkspaces
# modules-center = xwindow
modules-right = pulseaudio battery backlight wlan date

cursor-click = pointer
cursor-scroll = ns-resize

enable-ipc = true

; wm-restack = generic
; wm-restack = bspwm
; wm-restack = i3

; override-redirect = true
[module/backlight]
type = internal/backlight
format-prefix = %{T2}󰃠 %{T-}

; Use the following command to list available cards:
; $ ls -1 /sys/class/backlight/
; Default: first usable card in /sys/class/backlight (new in version 3.7.0)
card = intel_backlight

; Use the `/sys/class/backlight/.../actual-brightness` file
; rather than the regular `brightness` file.
; New in version 3.6.0
; Changed in version: 3.7.0: Defaults to true also on amdgpu backlights
; Default: true
use-actual-brightness = true

; Interval in seconds after which after which the current brightness is read
; (even if no update is detected).
; Use this as a fallback if brightness updates are not registering in polybar
; (which happens if the use-actual-brightness is false).
; There is no guarantee on the precisio of this timing.
; Set to 0 to turn off
; New in version 3.7.0
; Default: 0 (5 if use-actual-brightness is false)
poll-interval = 0

; Enable changing the backlight with the scroll wheel
; NOTE: This may require additional configuration on some systems. Polybar will
; write to `/sys/class/backlight/${self.card}/brightness` which requires polybar
; to have write access to that file.
; DO NOT RUN POLYBAR AS ROOT. 
; The recommended way is to add the user to the
; `video` group and give that group write-privileges for the `brightness` file.
; See the ArchWiki for more information:
; https://wiki.archlinux.org/index.php/Backlight#ACPI
; Default: false
enable-scroll = true

; Interval for changing the brightness (in percentage points).
; New in version 3.7.0
; Default: 5
scroll-interval = 10

[module/systray]
type = internal/tray

format-margin = 8pt
tray-spacing = 16pt

[module/xworkspaces]
type = internal/xworkspaces

label-active = %name%
label-active-background = ${colors.mauve}
label-active-foreground = ${colors.crust}
label-active-underline= ${colors.lauve}
label-active-padding = 1

label-occupied = %name%
label-occupied-padding = 1

label-urgent = %name%
label-urgent-background = ${colors.alert}
label-urgent-padding = 1

label-empty = %name%
label-empty-foreground = ${colors.disabled}
label-empty-padding = 1

[module/xwindow]
type = internal/xwindow
label = %title:0:60:...%

[module/filesystem]
type = internal/fs
interval = 25

mount-0 = /

label-mounted = %{F#F0C674}%mountpoint%%{F-} %percentage_used%%

label-unmounted = %mountpoint% not mounted
label-unmounted-foreground = ${colors.disabled}

[module/pulseaudio]
type = internal/pulseaudio

format-volume-prefix = "VOL "
format-volume-prefix-foreground = ${colors.primary}
format-volume = <label-volume>

label-volume = %percentage%%

label-muted = muted
label-muted-foreground = ${colors.disabled}

[module/xkeyboard]
type = internal/xkeyboard
blacklist-0 = num lock

label-layout = %layout%
label-layout-foreground = ${colors.primary}

label-indicator-padding = 2
label-indicator-margin = 1
label-indicator-foreground = ${colors.background}
label-indicator-background = ${colors.secondary}

[module/memory]
type = internal/memory
interval = 2
format-prefix = "RAM "
format-prefix-foreground = ${colors.primary}
label = %percentage_used:2%%

[module/cpu]
type = internal/cpu
interval = 2
format-prefix = "CPU "
format-prefix-foreground = ${colors.primary}
label = %percentage:2%%

[module/battery]
type = internal/battery
format-prefix = "HEY "
format-prefix-foreground = ${colors.primary}
full-at = 99
format-charging = <animation-charging> <label-charging>
animation-charging-0 = 
animation-charging-1 = 
animation-charging-2 = 
animation-charging-3 = 
animation-charging-4 = 
; Framerate in milliseconds
animation-charging-framerate = 750
animation-charging-foreground = ${colors.peach}
format-discharging = <ramp-capacity> <label-discharging>
ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 
low-at = 5
;get battery by running ls -1 /sys/class/power_supply/
battery = BAT0 
;get adapter by running ls -1 /sys/class/power_supply/
adapter = AC
poll-interval = 5

[network-base]
type = internal/network
interval = 5
format-connected = <label-connected>
format-disconnected = <label-disconnected>
label-disconnected = %{F#F0C674}%ifname%%{F#707880} disconnected

[module/wlan]
inherit = network-base
interface-type = wireless
label-connected = %{A1:nm-connection-editor:} %{T2}%{T-} %essid% %{A}
label-disconnected = %{A1:nm-connection-editor:} %{T2}%{T-} Disconnected %{A}
; %{A1:command:} clickable text %{A}

[module/eth]
inherit = network-base
interface-type = wired
label-connected = %{F#F0C674}%ifname%%{F-} %local_ip%

[module/date]
type = internal/date
interval = 1

; date = %H:%M
date = %I:%M %p
date-alt = %m-%d-%Y %I:%M %p

label = %date%
label-foreground = ${colors.primary}

[settings]
screenchange-reload = true
pseudo-transparency = true

		'';
	};
}
