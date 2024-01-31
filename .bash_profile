#!/bin/bash

# kubectl context in the bottom iterm bar
# Swap profile if production
iterm2_print_user_vars() {
  export kube_context=$(kubectl config current-context 2>/dev/null)
  iterm2_set_user_var kube_context $kube_context
  if [ "$kube_context" = "cal-production" ] ; then
    profile="Bubba-Prod-Shell"
  else
    profile="Bubba-Shell"
  fi
  echo -e "\033]50;SetProfile=$profile\a"
}

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# how I prefer to make witty comments in code
export EDITOR='nvim'
alias vim='nvim'
alias cim='nvim'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias vo='nvim $(fzf --height 40%)'
alias f='flyctl'

source ~/.secrets
source ~/.calendly
source ~/.cluster-lifecycle

# now you know the exact time you messed up
export HISTTIMEFORMAT="%d/%m/%y %T "

# Hashicorp
alias t="terraform"
#alias v="vault"

#alias r="rancher"
alias c="clusteradm"

# Kubernaughties
source <(kubectl completion bash)
alias k="kubectl"
#alias kk="kubectx"
function kk () {
  # kubectx but it adjusts its height to the number of contexts
  # xargs is trimming whitespace here
  numContexts=`kubectl config get-contexts --no-headers | wc -l | xargs`
  height=$((numContexts + 1))
  FZF_DEFAULT_OPTS="--info=hidden --height=$height" kubectx $@
}
complete -F __start_kubectl k
complete -o default -F __start_kubectl k

# Golang
export GOPATH=$HOME/go

# general quality of life improvements
alias ll="/bin/ls -lhFG"
alias ls="/bin/ls -FG"
alias la='/bin/ls -laG'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias path='echo -e ${PATH//:/\\n}'

# because I work hard to be lazy and dont like typing source <file_path>
alias rbash=". ~/.bash_profile"

# git helpers
alias gca='git commit -a'
alias gst='git status -uno'

# Completions
[ -f ~/.config/exercism/exercism_completion.bash ] && . ~/.config/exercism/exercism_completion.bash
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# make my prompt look leet hacker like
export PS1="\n\[\033[38;5;178m\]\W \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;45m\]>\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# need dis sometimes
alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'

# Created by `pipx` on 2021-11-16 16:04:44
export PATH="$PATH:/Users/briansmith/.local/bin"

# asdf is life
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Dont auto-update on brew install
HOMEBREW_NO_AUTO_UPDATE=1

# Github Commit signing
export GPG_TTY=$(tty)
eval "$(/opt/homebrew/bin/brew shellenv)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bubba/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/bubba/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bubba/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/bubba/Downloads/google-cloud-sdk/completion.bash.inc'; fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
fi

export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
export PATH="~/go/bin:$PATH"

### History
# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
