#!/bin/bash

homedir_files_to_sync=(
  .gitignore
  .gitconfig
  .git-commit-template
  .bash_profile
  .salesloft
  .vimrc
  .tmux.conf
  .slack-theme
)

for file in ${homedir_files_to_sync[@]}; do
  yes | cp -rf ~/${file} ~/src/dotfiles/${file}
done

yes | cp -rf ~/.tmux_scripts/. ~/src/dotfiles/.tmux_scripts
yes | cp -rf ~/.config/nvim/init.vim ~/src/dotfiles/.config/nvim/init.vim

sed -i -E 's/signingkey = [A-Z0-9]*/signingkey = SUPERSEKRETKEY123456/g' .gitconfig
