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
alias be='bundle exec'
alias ber='bundle exec rake'
alias bes='bundle exec foreman start'
alias rs='bundle exec rspec --format documentation --default-path regression_specs'
alias rst='bundle exec rspec --format documentation --default-path regression_specs -t'

alias omni="ssh-agent && ssh-add ~/.ssh/id_rsa; ssh -A briansmith@omni1.salesloft.com"
alias lata="echo $1"
#alias d='puma -b "ssl://0.0.0.0:9898?key=../localhost.salesloft.com.key&cert=../localhost.salesloft.com.crt&verify_mode=none"'
#alias dd='puma -b "ssl://0.0.0.0:9898?key=/Users/briansmith/src/localhost.salesloft.com.key&cert=/Users/briansmith/src/localhost.salesloft.com.crt&verify_mode=none"'

alias gb='git branch'
alias gca='rubocop_if_melody; git commit -a'
alias gst='git status -uno'
alias gbl="git branch --sort=creatordate --format='%(authordate:short) %(color:red)%(objectname:short) %(color:cyan)%(committername)%(color:reset) %(color:yellow)%(refname:short)%(color:reset) (%(color:green)%(committerdate:relative)%(color:reset))' | grep -v ';HEAD$' | column -s ';' -t"

alias irb='irb --simple-prompt'
alias start_mysql='sudo launchctl load -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist'
alias stop_mysql='sudo launchctl unload -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist'
alias rbash=". ~/.bash_profile"

alias melody="cd ~/src/melody && bundle install && bundle exec foreman start"

rubocop_if_melody () {
    [[ "$PWD" =~ melody ]] && rubocop -a
}

alias k="kubectl"
alias vimgolf="/opt/rubies/2.2.4/lib/ruby/gems/2.2.0/gems/vimgolf-0.4.8/bin/vimgolf"

alias mypack='ssh rails@107.170.30.9'
alias mypack_root='ssh root@107.170.30.9'
alias briansmith.io='ssh rails@162.243.31.85'
alias briansmith.io_root='ssh root@162.243.31.85'

export CLICOLOR=1
export GREP_OPTIONS='--color=auto'

MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export PATH=$PATH:/usr/local/mongodb/bin
export PATH=$PATH:/opt/rubies/2.2.4/lib/ruby/gems/2.2.0/gems/consular-1.0.3
export PATH=/usr/X11/bin/:/usr/local/bin/nginx:/usr/local/Cellar/phantomjs/1.9.8/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home

#Bash git completion - brew install git bash-completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi

#export PS1="\033[32m\]\u \[\033[36m\w \[\033[38;5;15m\]\$(parse_git_branch)
#> "
export PS1="\n\[\033[38;5;178m\]\W \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;45m\]>\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

parse_git_branch() {
    [[ -d .git ]] && git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

docker_exec(){ docker exec -ti $(docker ps | grep $1 |cut -d' ' -f 1) bash; }
alias de='docker_exec'

kube_exec(){ kubectl exec -ti $(kubectl get pods | grep $1 |cut -d' ' -f 1) /bin/bash; }
alias ke='kube_exec'

kube_delete(){ kubectl delete pod $(kubectl get pods | grep $1 |cut -d' ' -f 1); }
alias kd='kube_delete'

function kubelogs() {
  if [ -z "$1" ]
    then
      echo "You must include a service name as an argument"
      return 1
    else
      POD=$(kubectl get pods | grep $1 | grep Running | head -1 | awk {'print $1'})
      if [ -z "$POD" ]
        then
          echo "No matching pod found"
          return 1
        else
          kubectl logs $POD $2
      fi
  fi
}
alias kl='kubelogs' 
alias kp='k get pods'
source /opt/boxen/env.sh

export PATH=/usr/local/Homebrew/opt/imagemagick@6/bin:/Users/briansmith/Downloads:$PATH

function kubeshell() {
  if [ -z "$1" ]
    then
      echo "You must include a service name as an argument"
      return 1
    else
      POD=$(kubectl get pods | grep ${1}-[0-9] | grep Running | head -1 | awk {'print $1'})
      if [ -z "$POD" ]
        then
          echo "No matching pod found"
          return 1
        else
          kubectl exec -it $POD /bin/bash || kubectl exec -it $POD /bin/sh
      fi
  fi
}


function kubeexec() {
  if [ -z "$1" ] || [ -z "$2" ]
    then
      echo "You must include a service name and a command as arguments"
      return 1
    else
      POD=$(kubectl get pods | grep ${1}-[0-9] | grep Running | head -1 | awk {'print $1'})
      if [ -z "$POD" ]
        then
          echo "No matching pod found"
          return 1
        else
          kubectl exec $POD $2
      fi
  fi
}

function kubelogs() {
  if [ -z "$1" ]
    then
      echo "You must include a service name as an argument"
      return 1
    else
      POD=$(kubectl get pods | grep ${1}-[0-9] | grep Running | head -1 | awk {'print $1'})
      if [ -z "$POD" ]
        then
          echo "No matching pod found"
          return 1
        else
          kubectl logs $POD $2
      fi
  fi
}

function kubekill() {
  if [ -z "$1" ]
    then
      echo "You must include a service name as an argument"
      return 1
    else
      kubectl get pods | grep ${1}-[0-9] | awk {'print $1'} | xargs kubectl delete pod
  fi
}

source /Users/briansmith/src/awssh/setup.bash
function kpods() {
  kubectl get pods | grep ${1}-[0-9] | awk {'print $1'}
}

#if [[ $TMUX ]]; then source ~/.tmux-git/tmux-git.sh; fi
