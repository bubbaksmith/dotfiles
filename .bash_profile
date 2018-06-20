source ~/.secrets

alias f1="awk '{print \$1}'"
alias g="grep"

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
alias pw='echo T03kmZg27Vdx8iOW'
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

# SalesLoft
alias omni="ssh-agent && ssh-add ~/.ssh/id_rsa; ssh -A briansmith@omni1.salesloft.com"
alias melody="cd ~/src/melody && bundle install && bundle exec foreman start"
alias update_mel="cd ~/src/melody && npm install && npm run build && bundle install && bin/rake db:migrate RAILS_ENV=test"

rubocop_if_melody () {
  [[ "$PWD" =~ melody ]] && rubocop -a
}

# Git
alias gb='git branch'
alias gca='rubocop_if_melody; git commit -a'
alias gst='git status -uno'
alias gbl="git branch --sort=creatordate --format='%(authordate:short) %(color:red)%(objectname:short) %(color:cyan)%(committername)%(color:reset) %(color:yellow)%(refname:short)%(color:reset) (%(color:green)%(committerdate:relative)%(color:reset))' | grep -v ';HEAD$' | column -s ';' -t"
parse_git_branch() {
  [[ -d .git ]] && git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

alias k="kubectl"
alias vimgolf="/opt/rubies/2.2.4/lib/ruby/gems/2.2.0/gems/vimgolf-0.4.8/bin/vimgolf"

alias mypack='ssh rails@107.170.30.9'
alias mypack_root='ssh root@107.170.30.9'
alias briansmith.io='ssh rails@162.243.31.85'
alias briansmith.io_root='ssh root@162.243.31.85'

export GREP_OPTIONS='--color=auto'
export LS_COLORS='on'

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export PATH=$PATH:/usr/local/mongodb/bin
export PATH=$PATH:/opt/rubies/2.2.4/lib/ruby/gems/2.2.0/gems/consular-1.0.3
export PATH=$PATH:/usr/bin:/usr/local/bin/
export PATH=/usr/X11/bin/:/usr/local/bin/nginx:/usr/local/Cellar/phantomjs/1.9.8/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home

#Bash git completion - brew install git bash-completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi

# Prompt (Power Shell 1)
export PS1="\n\[\033[38;5;178m\]\W \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;45m\]>\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

docker_exec(){ docker exec -ti $(docker ps | grep $1 |cut -d' ' -f 1) bash; }
alias de='docker_exec'

alias kpw='watch kubectl get pods'
alias kp='k get pods'
alias kbp='kube_build_push && kube_command delete && watch kubectl get pods'
alias ke='kube_command exec_into'
alias kc='kubectl config use-context'
alias kd='kube_command delete && watch kubectl get pods'
alias kl='kube_command log'
function kube_build_push() {
  docker build . -t registry.qasalesloft.com/hydra2:latest
  docker push registry.qasalesloft.com/hydra2:latest
}
function hydra_pod() {
  kubectl get pods | grep hydra2-[0-9] | head -1 | awk {'print $1'}
}
function kube_command() {
  POD=$(hydra_pod)
  if [ -z "$POD" ]; then
    echo "No matching pod found" && return 1
  else
    case "$1" in
      "exec_into" )
        kubectl exec -it $POD /bin/bash || kubectl exec -it $POD /bin/sh ;;
      "delete" )
        kubectl delete pod $POD ;;
      "log" )
        kubectl log $POD -f ;;
      * )
        echo "You have failed to match anything" ;;
    esac
  fi
}

source /opt/boxen/env.sh

export PATH=/usr/local/Homebrew/opt/imagemagick@6/bin:/Users/briansmith/Downloads:$PATH
