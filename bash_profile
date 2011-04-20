source ~/.bash_aliases

export PATH=~/bin:~/.cabal/bin:/usr/local/share/npm/bin:/usr/local/Cellar/ruby/1.9.1-p378/bin:/usr/local/bin:/usr/local/sbin:/usr/local/Library/Contributions/examples:/opt/local/bin:/opt/local/sbin:$PATH

# Color terminal
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export EDITOR="vim"

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
fi

RED="\[\e[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\e[0;32m\]"
WHITE="\[\033[1;37m\]"
CLR="\[\033[0m\]"

PS1="\u@$WHITE\h$CLR:$GREEN\W$YELLOW\$(__git_ps1)$CLR\$ "

export NARWHAL_ENGINE=jsc

export PATH="/usr/local/narwhal/bin:$PATH"

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export USERWM=/usr/local/bin/xmonad
