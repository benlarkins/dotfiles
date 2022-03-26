
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


