source /opt/boxen/env.sh
source ~/.salesloft
source ~/.secrets
#source ~/.k8s_qa_commands
source ~/.k8s_hydra2_commands

export EDITOR='vim'
eval "$(nodenv init -)"

alias f1="awk '{print \$1}'"
alias f2="awk '{print \$2}'"
alias f3="awk '{print \$3}'"

alias g="grep"
alias h="heroku"
alias k="kubectl"
alias mc="mix compile"

#alias vo='vim $(fzf)'
alias vo='vim $(fzf --height 40%)'

alias ll="ls -lhFG"
alias ls="ls -FG"
alias la='ls -laG'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias clean='cd ~/Library/Caches/;sudo rm -rf ~/Library/Caches/*;cd /private/var/tmp/;sudo rm -rf TM*;sudo rm -rf /private/var/folders/;Sudo rm -rf /private/var/log/*;cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias path='echo -e ${PATH//:/\\n}'

alias r='rake'
alias cpu='top -o cpu'
alias mem='top -o rsize'
alias rbash=". ~/.bash_profile"

# Testing
alias irb='irb --simple-prompt'
alias be='bundle exec'
alias ber='bundle exec rake'
alias bes='bundle exec foreman start'
alias rs='bundle exec rspec --format documentation --default-path regression_specs'
alias rst='bundle exec rspec --format documentation --default-path regression_specs -t'

# Git
alias gb='git branch'
alias gca='rubocop_if_melody; git commit -a'
alias gst='git status -uno'
alias gbl="git branch --sort=creatordate --format='%(authordate:short) %(color:red)%(objectname:short) %(color:cyan)%(committername)%(color:reset) %(color:yellow)%(refname:short)%(color:reset) (%(color:green)%(committerdate:relative)%(color:reset))' | grep -v ';HEAD$' | column -s ';' -t"
parse_git_branch() {
  [[ -d .git ]] && git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
rubocop_if_melody () {
  [[ "$PWD" =~ melody ]] && rubocop -a
}

alias vimgolf="/opt/rubies/2.2.4/lib/ruby/gems/2.2.0/gems/vimgolf-0.4.8/bin/vimgolf"

export GREP_OPTIONS='--color=auto'
export LS_COLORS='on'

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home

# Completions
[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash
[ -f ~/.config/exercism/exercism_completion.bash ] && . ~/.config/exercism/exercism_completion.bash
[ -f /usr/local/Homebrew/etc/bash_completion ] && . /usr/local/Homebrew/etc/bash_completion
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Prompt (Power Shell 1)
export PS1="\n\[\033[38;5;178m\]\W \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;45m\]>\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

export PATH="$(brew --prefix)/bin:$PATH"
export PATH=/usr/local/Homebrew/opt/imagemagick@6/bin:/Users/briansmith/Downloads:$PATH
export PATH="/usr/local/Homebrew/opt/elasticsearch@5.6/bin:$PATH"

#ErlangInstaller
export PATH="~/.erlangInstaller/default/bin:$PATH"export PATH="/usr/local/Homebrew/opt/erlang@20/bin:$PATH"

# Don't expand tilde override for bash_completion
function _expand() { :;}
