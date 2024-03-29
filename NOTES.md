# Window manager setup

## Natural mouse scroll
Edit /usr/share/X11/xorg.conf.d/40-libinput.conf

Find section that includes `pointer catchAll` and add the following line:
`Option "NaturalScrolling" "on"`

Now the section should show:
```
Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Option "NaturalScrolling" "on"
        Driver "libinput"
EndSection
```

## VPN issues
Start NetworkManager
Install and run nm-applet (Note on Fedora the package is called network-manager-applet)

## Cursor theme does not match between applications and background
Edit `/usr/share/icons/default/index.theme`
Find `Inherits=` and update to use the cursor theme.

NOTE: The cursor theme must be set to the theme directory name. For example `/usr/share/icons/{theme-directory-name}` `Inherits={theme-directory-name}`


## Key remapping
Use [keyd](https://github.com/rvaiya/keyd) to remap keys. This allows key remaps to work from one distro to another. Also allows oneshot and overloading.
