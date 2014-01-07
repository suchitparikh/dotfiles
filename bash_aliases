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
alias sendlib='cd /opt/sendgrid/sendlib'
alias sendlibp='cd /opt/sendgrid/sendlib-python'
alias apid='cd /opt/sendgrid/apid'
alias bounced='cd /opt/sendgrid/bounced'
alias ismtpd='cd /opt/sendgrid/ismtpd'
alias filterd='cd /opt/sendgrid/filterd'
alias kamta='cd /opt/sendgrid/kamta'
alias linkd='cd /opt/sendgrid/linkd'
alias apps='cd /opt/sendgrid/apps'
alias eventd='cd /opt/sendgrid/eventd'
alias webapid='cd /opt/sendgrid/webapid'
alias acceptance='cd /opt/sendgrid/mp-acceptance'
alias tools='cd /opt/sendgrid/apps/tools'
alias mp-qa='cd /opt/sendgrid/apps/devs/suchit/mp-qa'
alias eventstreamerd='cd /opt/sendgrid/eventstreamerd/current'

# virtual environments
alias vacc='source /usr/local/venv/vacc/bin/activate'
