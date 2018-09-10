# daily use
alias cls='clear'
<<<<<<< HEAD
alias rm='rm -i'
alias mv='mv -i'
alias ll='ls -lAhFG'
alias lt='ls -lahFGt'

alias hosts='sudo vim /etc/hosts'
alias bkhosts='sudo cp /etc/hosts ~/sg/hosts'
alias sghosts='sudo cp ~/sg/hosts /etc/hosts'
alias code='cd ~/sg/code'
alias deploy='cd ~/sg/code/deploy-stuff'

#
alias grep='grep --color'
alias nets='netstat -tuln | grep '
alias proc='ps aux | grep '
alias refresh='source ~/.bashrc'
alias dnsf='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# LAZIER
alias c='clear'
alias r='source ~/.bashrc'
alias s='sudo bash'

# NON-GO APPS
alias cod='cd ~/sg/code/'
alias apps='cd ~/sg/code/appdev/'
alias ops='cd ~/sg/code/ops'

# MYSQL 
alias mysql-start='brew services start mysql'
alias mysql-stop='brew services stop mysql'

# GIT
alias g='git'
alias gcl='g br --merged | grep -v "\*" | grep -v master | xargs -n 1 git branch -d'
alias gclf='g br | grep -v "\*" | grep -v master | xargs -n 1 git branch -D'
alias gu='g co master; g fap; g po master; gcl'
alias gdm='g df origin/master'
alias ge='git commit --allow-empty -m "Trigger build"'

# GO
alias gow='cd $GOPATH/src/github.com/sendgrid'

# SUBLIME
alias osubl='ops && subl .'

## DOCKER
alias dsp='docker system prune'
alias dspf='docker system prune -f'

# docker kill all
alias dka='docker ps -a | awk "{print \$1}" | tail -n +2 | xargs docker rm -f'
alias dki='docker images | grep "<none>" | awk "{print \$3}" | xargs docker rmi'
alias dcl='dka; dki'

# docker compose, machine, et al.
alias dc='docker-compose'
alias dm='docker-machine'
alias dmenv='eval "$(docker-machine env default)"'
