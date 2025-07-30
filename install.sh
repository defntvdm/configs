#!/bin/bash

set -xe
# init config dir
mkdir -p ~/.config

# rm if exists
rm -rf ~/.clang-format
rm -rf ~/.config/hypr
rm -rf ~/.config/kitty
rm -rf ~/.config/mako
rm -rf ~/.config/nvim
rm -rf ~/.config/rofi
rm -rf ~/.config/waybar
rm -rf ~/.gitconfig
rm -rf ~/.gitignore_global
rm -rf ~/.ruff.toml
rm -rf ~/.tmux.conf
rm -rf ~/.zprofile
rm -rf ~/.zshrc
sudo rm -rf /etc/greetd/*

# create symlinks
ln -s /home/defntvdm/configs/clang-format ~/.clang-format
ln -s /home/defntvdm/configs/gitconfig ~/.gitconfig
ln -s /home/defntvdm/configs/gitignore_global ~/.gitignore_global
ln -s /home/defntvdm/configs/hypr ~/.config/hypr
ln -s /home/defntvdm/configs/kitty ~/.config/kitty
ln -s /home/defntvdm/configs/mako ~/.config/mako
ln -s /home/defntvdm/configs/nvim ~/.config/nvim
ln -s /home/defntvdm/configs/rofi ~/.config/rofi
ln -s /home/defntvdm/configs/ruff.toml ~/.ruff.toml
ln -s /home/defntvdm/configs/tmux.conf ~/.tmux.conf
ln -s /home/defntvdm/configs/waybar ~/.config/waybar
ln -s /home/defntvdm/configs/zprofile ~/.zprofile
ln -s /home/defntvdm/configs/zshrc ~/.zshrc
sudo cp -r /home/defntvdm/configs/greetd /etc/
