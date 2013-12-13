UNAME=`uname`
if [[ $UNAME == "Linux" ]]; then
    alias ls='ls --color=auto'
fi

# General
alias cls='clear'
alias ll='ls -lahGF'
alias lla='ls -la'
alias llh='ls -lh'

alias refresh='source ~/.bashrc'
alias nets='netstat -tulpn | grep'
alias proc='ps aux | grep'

# Git
alias g='git'

# mp dev aliases
alias sendlib='cd /usr/local/sendlib'
alias sendlibp='cd /usr/local/sendlib-python'
alias apid='cd /usr/local/apid'
alias bounced='cd /usr/local/bounced'
alias ismtpd='cd /usr/local/ismtpd'
alias filterd='cd /usr/local/filterd'
alias kamta='cd /usr/local/kamta'
alias linkd='cd /usr/local/linkd'
alias apps='cd /usr/local/apps'
alias eventd='cd /usr/local/eventd'
alias webapid='cd /usr/local/webapid'
alias acceptance='cd /usr/local/mp-acceptance'
alias tools='cd /usr/local/apps/tools'
alias mp-qa='cd /usr/local/apps/devs/suchit/mp-qa'
alias eventstreamerd='cd /opt/sendgrid/eventstreamerd/current'

# virtual environments
alias vacc='source /usr/local/venv/vacc/bin/activate'
