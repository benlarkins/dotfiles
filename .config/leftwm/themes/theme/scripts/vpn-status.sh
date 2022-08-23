#!/bin/bash
status=$(protonvpn-cli s)
server=$(echo "$status" | grep 'Server:' | awk -F ":" '{print $2}' | xargs)
load=$(echo "$status" | grep 'Server Load:' | awk -F ":" '{print $2}' | xargs)
echo "$server $load"
