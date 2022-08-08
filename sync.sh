#!/bin/bash

yes | cp -rf ~/.gitignore ~/src/dotfiles/.gitignore

yes | cp -rf ~/.bash_profile ~/src/dotfiles/.bash_profile
yes | cp -rf ~/.salesloft ~/src/dotfiles/.salesloft
yes | cp -rf ~/.gitconfig ~/src/dotfiles/.gitconfig

yes | cp -rf ~/.vimrc ~/src/dotfiles/.vimrc
#yes | cp -rf ~/.ideavimrc ~/src/dotfiles/.ideavimrc

yes | cp -rf ~/.tmux.conf ~/src/dotfiles/.tmux.conf
yes | cp -rf ~/.tmux_scripts/. ~/src/dotfiles/.tmux_scripts

yes | cp -rf ~/.config/nvim/init.vim ~/src/dotfiles/.config/nvim/init.vim
