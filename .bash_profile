# kubectl context in the bottom iterm bar
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
iterm2_print_user_vars() {
  KUBECONTEXT=$(CTX=$(kubectl config current-context) 2> /dev/null;if [ $? -eq 0 ]; then echo $CTX;fi)
  iterm2_set_user_var kubeContext $KUBECONTEXT
}

# how I prefer to make witty comments in code
export EDITOR='nvim'
alias vim='nvim'
alias cim='nvim'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias vo='nvim $(fzf --height 40%)'

# spit out some work specific things
source ~/.aliases
source ~/.salesloft
source ~/.secrets
source ~/.kate
export PATH="/User/briansmith/scripts:$PATH"

# now you know the exact time you messed up
export HISTTIMEFORMAT="%d/%m/%y %T "

# love and hate you
alias t="terraform"

# Kubernaughties
source <(k completion bash)
alias k="kubectl"
complete -F __start_kubectl k
complete -o default -F __start_kubectl k

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
source $(brew --prefix asdf)/asdf.sh
source $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

# Dont auto-update on brew install
HOMEBREW_NO_AUTO_UPDATE=1

# Github Commit signing
export GPG_TTY=$(tty)

# Salesloft solution to AWS credentials rotation
source /usr/local/bin/load_aws_creds.sh
