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
alias be='bundle exec'
alias ber='bundle exec rake'
alias bes='bundle exec foreman start'
alias rs='bundle exec rspec --format documentation --default-path regression_specs'
alias rst='bundle exec rspec --format documentation --default-path regression_specs -t'

alias omni="ssh-agent && ssh-add ~/.ssh/id_rsa; ssh -A briansmith@omni1.salesloft.com"
alias lata="echo $1"
#alias d='puma -b "ssl://0.0.0.0:9898?key=../localhost.salesloft.com.key&cert=../localhost.salesloft.com.crt&verify_mode=none"'
#alias dd='puma -b "ssl://0.0.0.0:9898?key=/Users/briansmith/src/localhost.salesloft.com.key&cert=/Users/briansmith/src/localhost.salesloft.com.crt&verify_mode=none"'

source /Users/briansmith/.secrets

alias gb='git branch'
alias gca='rubocop_if_melody; git commit -a'
alias gst='git status -uno'
alias gbl="git branch --sort=creatordate --format='%(authordate:short) %(color:red)%(objectname:short) %(color:cyan)%(committername)%(color:reset) %(color:yellow)%(refname:short)%(color:reset) (%(color:green)%(committerdate:relative)%(color:reset))' | grep -v ';HEAD$' | column -s ';' -t"

alias irb='irb --simple-prompt'
alias start_mysql='sudo launchctl load -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist'
alias stop_mysql='sudo launchctl unload -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist'
alias rbash=". ~/.bash_profile"

alias melody="cd ~/src/melody && bundle install && bundle exec foreman start"
alias update_mel="cd ~/src/melody && npm run clean && npm install && bundle install && bin/rake db:migrate RAILS_ENV=test && bin/rake db:migrate RAILS_ENV=development"

rubocop_if_melody () {
    [[ "$PWD" =~ melody ]] && rubocop -a
}

alias k="kubectl"
alias vimgolf="/opt/rubies/2.2.4/lib/ruby/gems/2.2.0/gems/vimgolf-0.4.8/bin/vimgolf"

alias mypack='ssh rails@107.170.30.9'
alias mypack_root='ssh root@107.170.30.9'
alias briansmith.io='ssh rails@162.243.31.85'
alias briansmith.io_root='ssh root@162.243.31.85'

export GREP_OPTIONS='--color=auto'
export LS_COLORS='on'

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

export HYDRA_GITHUB_TOKEN='83df407186a456b731d7c2f80c0301a341b5ea4a'

alias kpw='watch kubectl get pods -n hydra2'
alias kp='k get pods -n hydra2'
alias kbp='kube_build_push && kube_command delete && watch kubectl get pods -n hydra2'
alias ke='kube_command exec_into'
alias kc='kubectl config use-context'
alias kd='kube_command delete && watch kubectl get pods -n hydra2'
alias kl='kube_command log'
function kube_build_push() {
  docker build . -t registry.qasalesloft.com/hydra2:latest
  docker push registry.qasalesloft.com/hydra2:latest
}
function hydra_pod() {
  kubectl get pods -n hydra2 | grep hydra2-[0-9] | head -1 | awk {'print $1'}
}
function kube_command() {
  POD=$(hydra_pod)
  if [ -z "$POD" ]; then
    echo "No matching pod found" && return 1
  else
    case "$1" in
      "exec_into" )
        kubectl exec -it -n hydra2 $POD /bin/bash || kubectl exec -it $POD /bin/sh ;;
      "delete" )
        kubectl delete pod -n hydra2 $POD ;;
      "log" )
        kubectl log -n hydra2 $POD -f ;;
      * )
        echo "You have failed to match anything" ;;
    esac
  fi
}

source /opt/boxen/env.sh

export AWSSH_BASTION_HOST='omni1.salesloft.com'
export AWSSH_USERNAME='briansmith'
export AWSSH_ACCESS_KEY_ID='AKIAIQ6PG3HOZOPBDBFQ'
export AWSSH_SECRET_ACCESS_KEY='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'

export PATH=/usr/local/Homebrew/opt/imagemagick@6/bin:/Users/briansmith/Downloads:$PATH
#if [[ $TMUX ]]; then source ~/.tmux-git/tmux-git.sh; fi
