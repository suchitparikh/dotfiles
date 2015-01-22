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
alias sendlib='cd $WORKSPACE/sendlib'
alias sendlibp='cd $WORKSPACE/sendlib-python'
alias apid='cd $WORKSPACE/apid'
alias bounced='cd $WORKSPACE/bounced'
alias ismtpd='cd $WORKSPACE/ismtpd'
alias filterd='cd $WORKSPACE/filterd'
alias kamta='cd $WORKSPACE/kamta'
alias linkd='cd $WORKSPACE/linkd'
alias apps='cd $WORKSPACE/apps'
alias eventd='cd $WORKSPACE/eventd'
alias webapid='cd $WORKSPACE/webapid'
alias acceptance='cd $WORKSPACE/mp-acceptance'
alias tools='cd $WORKSPACE/apps/tools'
alias mp-qa='cd $WORKSPACE/apps/devs/suchit/mp-qa'
alias eventstreamerd='cd $WORKSPACE/eventstreamerd/current'
alias ops='cd $WORKSPACE/ops'
alias spt='cd $GOPATH/src/github.com/sendgrid/spt'

# virtual environments
alias vacc='source /usr/local/venv/vacc/bin/activate'
