test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
iterm2_print_user_vars() {
  KUBECONTEXT=$(CTX=$(kubectl config current-context) 2> /dev/null;if [ $? -eq 0 ]; then echo $CTX;fi)
  iterm2_set_user_var kubeContext $KUBECONTEXT
}

alias vim='nvim'
alias vimrc='nvim ~/.config/nvim/init.vim'

source ~/.aliases
source ~/.salesloft
source ~/.secrets
source ~/.kate
export PATH="/User/briansmith/scripts:$PATH"

# Put time in bash history
export HISTTIMEFORMAT="%d/%m/%y %T "

export EDITOR='vim'
alias cim="vim"
alias mux="tmuxinator"

# pass aliases to watch
alias watch='watch '

alias g="grep"
alias h="heroku"
alias hl="heroku logs --tail"
alias hp="git push heroku master && heroku logs --tail"
alias k="kubectl"
alias t="terraform"
alias mc="mix compile"

complete -F __start_kubectl k
complete -o default -F __start_kubectl k
source <(k completion bash)

#alias vo='vim $(fzf)'
alias vo='vim $(fzf --height 40%)'

alias ll="/bin/ls -lhFG"
alias ls="/bin/ls -FG"
alias la='/bin/ls -laG'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias clean='cd ~/Library/Caches/;sudo rm -rf ~/Library/Caches/*;cd /private/var/tmp/;sudo rm -rf TM*;sudo rm -rf /private/var/folders/;Sudo rm -rf /private/var/log/*;cd ~'
alias path='echo -e ${PATH//:/\\n}'

alias rbash=". ~/.bash_profile"

# Testing
alias be='bundle exec'
alias ber='bundle exec rake'
alias bes='bundle exec foreman start'
alias rs='bundle exec rspec --format documentation --default-path regression_specs'
alias rst='bundle exec rspec --format documentation --default-path regression_specs -t'

# Git
alias gca='git commit -a'
alias gst='git status -uno'

# Completions
[ -f ~/.config/exercism/exercism_completion.bash ] && . ~/.config/exercism/exercism_completion.bash
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Prompt (Power Shell 1)
export PS1="\n\[\033[38;5;178m\]\W \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;45m\]>\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'

# Created by `pipx` on 2021-11-16 16:04:44
export PATH="$PATH:/Users/briansmith/.local/bin"

source $(brew --prefix asdf)/asdf.sh
source $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

# Dont auto-update on brew install
HOMEBREW_NO_AUTO_UPDATE=1

# Github Commit signing
export GPG_TTY=$(tty)

source /usr/local/bin/load_aws_creds.sh
