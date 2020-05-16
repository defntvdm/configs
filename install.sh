#!/bin/bash

cp ./ackrc ~/.ackrc
cp ./alacritty.yml ~/.alacritty.yml
mkdir -p ~/.config
cp ./config.py ~/.config/qutebrowser
cp ./gitconfig ~/.gitconfig
cp ./gitignore_global ~/.gitignore_global
mkdir -p ~/.config/i3
cp ./i3.config ~/.config/i3/config
mkdir -p ~/.config/i3status
cp ./i3status.config ~/.config/i3status/config
mkdir -p ~/.oh-my-zsh/themes
cp ./mytheme.zsh-theme ~/.oh-my-zsh/themes/mytheme.zsh-theme
cp ./tern-config ~/.tern-config
cp ./tmux.conf ~/.tmux.conf
mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim/init.vim
cp ./ycm_extra_conf.py ~/.ycm_extra_conf.py
cp ./zshrc ~/.zshrc
cp -r ./UltiSnips ~/.config/nvim/
