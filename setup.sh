#!/bin/bash

cp -r ~/.dotfiles/.gitpod/.config /home/gitpod
cp -r ~/.dotfiles/.gitpod/.node-version /home/gitpod
cp -r ~/.dotfiles/.gitpod/.tmux.conf /home/gitpod
sudo chsh -s /usr/bin/fish gitpod
curl -s https://api.github.com/repos/starship/starship/releases/latest \
    | grep browser_download_url \
    | grep x86_64-unknown-linux-gnu \
    | cut -d '"' -f 4 \
    | wget -qi - && \
    tar xvf starship-*.tar.gz && \
    sudo mv starship /usr/local/bin/ && \
    rm starship-*.tar.gz*
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
/usr/bin/fish -c 'curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher'
/usr/bin/fish -c 'fisher install /home/gitpod/.config/fish/fish_plugins'
nvim +'PlugInstall --sync' +qa

