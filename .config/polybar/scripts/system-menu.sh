#!/bin/sh
(
printf 'Lock,betterlockscreen -l\n'
printf 'Log out,logout\n'
printf 'Restart,reboot\n'
printf 'Shut down,shutdown now\n'
) | jgmenu --simple --at-pointer
