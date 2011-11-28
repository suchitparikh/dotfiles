[ -f ~/.bash_aliases ] && source ~/.bash_aliases

export PATH=/usr/local/Cellar/android-sdk/r12/tools:~/bin:~/.cabal/bin:/usr/local/share/npm/bin:/usr/local/Cellar/ruby/1.9.1-p378/bin:/usr/local/bin:/usr/local/sbin:/usr/local/Library/Contributions/examples:/opt/local/bin:/opt/local/sbin:$PATH

# Color terminal
# Enable colors in `ls`
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

export EDITOR="/usr/bin/vim"

# bash completion
. ~/.bash_completion.d/*
which brew 2>/dev/null >/dev/null
if [[ $? != 1 ]]; then
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
fi

RED="\[\e[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\e[0;32m\]"
WHITE="\[\033[0;37m\]"
CLR="\[\033[0m\]"

PS1="\u@$WHITE\h$CLR:$GREEN\W$YELLOW\$(__git_ps1)$CLR\$ "

export NARWHAL_ENGINE=jsc

export PATH="/usr/local/narwhal/bin:$PATH"

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Update history after every command so that history is shared between
# different sessions (and between Terminal windows)
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# For Go programming
if [ -f /usr/local/bin/brew ]; then
    export GOROOT=`brew --prefix go`
    export GOBIN="$GOROOT/bin"
fi

# For Node.js
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH
