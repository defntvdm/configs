#!/bin/bash

cp ./alacritty.toml ~/.alacritty.toml
cp ./clang-format ~/.clang-format
mkdir -p ~/.config
cp ./gitconfig ~/.gitconfig
cp ./gitignore_global ~/.gitignore_global
mkdir -p ~/.oh-my-zsh/themes
cp ./mytheme.zsh-theme ~/.oh-my-zsh/themes/mytheme.zsh-theme
cp ./tmux.conf ~/.tmux.conf
cp -r nvim ~/.config/nvim
cp ./zshrc ~/.zshrc
cp ./ruff.toml ~/.ruff.toml
