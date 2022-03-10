# List of fixes/tweaks for HP ELITEDESK G2 after ArcoLinux install

## Fix screen tearing
edit picom.conf
set `backend = "glx"`
and `vsync = true`

## Fix large cursor on 4K monitor
edit .Xresources
```
!Xcursor.theme: cursor-theme
Xcursor.size: 24
```
## Set keyboard options for all desktops
edit /etc/X11/xorg.conf.d/99-killX.conf
`Option         "XkbOptions" "terminate:ctrl_alt_bksp,ctrl:swap_lalt_lctl_lwin,caps:escape"`
