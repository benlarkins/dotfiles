#!/bin/bash

cp -r ~/.dotfiles/.gitpod/.config /home/gitpod
cp -r ~/.dotfiles/.gitpod/.node-version /home/gitpod
cp -r ~/.dotfiles/.gitpod/.tmux.conf /home/gitpod
sudo chsh -s /usr/bin/fish gitpod
/usr/bin/fish -c 'fisher install /home/gitpod/.config/fish/fish_plugins'

