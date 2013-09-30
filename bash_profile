[ -f ~/.bash_aliases ] && source ~/.bash_aliases

export PATH=/usr/local/go/bin:/usr/local/Cellar/android-sdk/r12/tools:~/bin:~/.cabal/bin:/usr/local/share/npm/bin:/usr/local/Cellar/ruby/1.9.1-p378/bin:/usr/local/bin:/usr/local/sbin:/usr/local/Library/Contributions/examples:/opt/local/bin:/opt/local/sbin:$PATH

# Color terminal
# Enable colors in `ls`
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

# for tmux: export 256color
[ -n "$TMUX" ] && export TERM=screen-256color

export EDITOR="/usr/bin/vim"

# bash completion
. ~/.bash_completion.d/*{,.bash}

RED="\[\e[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\e[0;32m\]"
WHITE="\[\033[0;37m\]"
BLUE="\[\e[0;34m\]"
CLR="\[\033[0m\]"

function __env_ps1 {
    if [ ! -z "$GOPATH" ]; then
        ENV=" GOPATH=$GOPATH"
    fi
    if [ ! -z "$PYTHONPATH" ]; then
        ENV="$ENV PYTHONPATH=$PYTHONPATH"
    fi
    echo -e $ENV | sed -e "s/:$//" -e "s|/usr/|/u/|g" -e "s|/local/|/l/|g" -e "s|$HOME|~|g"
}

PS1="\u@$WHITE\h$CLR:$GREEN\W$YELLOW\$(__git_ps1) $BLUE\$(__env_ps1)$YELLOW\n\$$CLR "

# Bash options
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
shopt -s autocd

# Update history after every command so that history is shared between
# different sessions (and between Terminal windows)
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# For Node.js
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

# Load host-specific bash_profile
HOSTNAME=`hostname`
[ -f ~/.dotfiles/bash_profile.$HOSTNAME ] && source ~/.dotfiles/bash_profile.$HOSTNAME
