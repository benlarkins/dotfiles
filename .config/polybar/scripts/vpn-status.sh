#!/bin/bash
status=$(protonvpn-cli s)
server=$(echo "$status" | grep 'Server:' | awk -F ":" '{print $2}' | xargs | tr '-' ' ' | tr -cd "'[A-Z] ")
load=$(echo "$status" | grep 'Server Load:' | awk -F ":" '{print $2}' | xargs)
echo "$server - $load"
