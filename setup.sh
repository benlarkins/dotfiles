#!/bin/bash

cp -r ~/.dotfiles/.gitpod /home/gitpod
sudo chsh -s /usr/bin/fish
fisher install /home/gitpod/.config/fish/fish_plugins
