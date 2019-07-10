#!/bin/bash

yes | cp -rf ~/.gitignore ~/src/dotfiles/.gitignore

yes | cp -rf ~/.bash_profile ~/src/dotfiles/.bash_profile
yes | cp -rf ~/.bashrc ~/src/dotfiles/.bashrc
yes | cp -rf ~/.gitconfig ~/src/dotfiles/.gitconfig
yes | cp -rf ~/.k8s_hydra2_commands ~/src/dotfiles/.k8s_hydra2_commands
yes | cp -rf ~/.vimrc ~/src/dotfiles/.vimrc


yes | cp -rf ~/.tmux_scripts/battery ~/src/dotfiles/.tmux_scripts/battery
yes | cp -rf ~/.tmux_scripts/git-branch ~/src/dotfiles/.tmux_scripts/git-branch
yes | cp -rf ~/.tmux_scripts/kube-context ~/src/dotfiles/.tmux_scripts/kube-context

