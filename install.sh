#!/bin/bash

set -xe

test -d /Users || sudo ln -s /home /Users

echo Installing pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

echo Installing oh-my-zsh and plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/Aloxaf/fzf-tab ~/.oh-my-zsh/custom/plugins/fzf-tab
cp ./zshrc ~/.zshrc
source ~/.zshrc

echo Installing nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

echo Installing fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
git clone --depth 1 https://github.com/junegunn/fzf-git.sh.git ~/.fzf/fzf-git.sh

echo Install yandex cloud cli
curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash
yc init

nvm install --latest

cp ./wezterm.lua ~/.wezterm.lua
cp ./clang-format ~/.clang-format
mkdir -p ~/.config
cp ./gitconfig ~/.gitconfig
cp ./gitignore_global ~/.gitignore_global
cp ./tmux.conf ~/.tmux.conf
cp -r nvim ~/.config/nvim
cp ./ruff.toml ~/.ruff.toml
