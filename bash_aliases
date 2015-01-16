UNAME=`uname`
if [[ $UNAME == "Linux" ]]; then
    alias ls='ls --color=auto'
fi

# General
alias cls='clear'
alias ll='ls -lAhGF'
alias lla='ls -la'
alias llh='ls -lh'
alias refresh='source ~/.bashrc'
alias nets='netstat -tulpn | grep'
alias proc='ps aux | grep'
alias fixresolv='sudo cp ~/tmp/resolv.conf /etc/resolv.conf'

# Git
alias g='git'

# mp dev aliases
alias sendlib='cd /home/vagrant/core_development/development_projects/sendlib'
alias sendlibp='cd /home/vagrant/core_development/development_projects/sendlib-python'
alias apid='cd /home/vagrant/core_development/development_projects/apid'
alias bounced='cd /home/vagrant/core_development/development_projects/bounced'
alias ismtpd='cd /home/vagrant/core_development/development_projects/ismtpd'
alias filterd='cd /home/vagrant/core_development/development_projects/filterd'
alias kamta='cd /home/vagrant/core_development/development_projects/kamta'
alias linkd='cd /home/vagrant/core_development/development_projects/linkd'
alias apps='cd /home/vagrant/core_development/development_projects/apps'
alias eventd='cd /home/vagrant/core_development/development_projects/eventd'
alias webapid='cd /home/vagrant/core_development/development_projects/webapid'
alias acceptance='cd /home/vagrant/core_development/development_projects/mp-acceptance'
alias tools='cd /home/vagrant/core_development/development_projects/apps/tools'
alias mp-qa='cd /home/vagrant/core_development/development_projects/apps/devs/suchit/mp-qa'
alias eventstreamerd='cd /home/vagrant/core_development/development_projects/eventstreamerd/current'
alias ops='cd /home/vagrant/core_development/development_projects/ops'
alias spt='cd /home/vagrant/core_development/development_projects/spt'

# virtual environments
alias vacc='source /usr/local/venv/vacc/bin/activate'
