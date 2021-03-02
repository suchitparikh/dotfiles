# source the .bash_aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Golang path
export GOPATH=~/sg/code/go
export PATH=$PATH:$GOPATH/bin

# avoid go mod pain
export GOSUMDB=off
export GOPROXY=direct
export GO111MODULE=off

# helm
export TILLER_NAMESPACE='deliverability'
export AWS_SESSION_TTL=12h

export HOMEBREW_GITHUB_API_TOKEN=0713c3d76687e4db78d9ce296cdb6291b8fa6100

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='(${venv})${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='(${venv})${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# PS_1
ps1_titlebar()
{
  case $TERM in
    (xterm*|rxvt*)
      printf "%s" "\033]0;\\u@\\h: \W\\007"
      ;;
  esac
}

ps1_identity()
{
  if (( $UID == 0 )) ; then
    printf "%s" "\[\033[31m\]\\u\[\033[0m\]@\[\033[36m\]\\h\[\033[35m\]:\w\[\033[0m\] "
  else
    printf "%s" "\[\033[33m\]\\u\[\033[0m\]@\[\033[36m\]\\h\[\033[35m\]:\w\[\033[0m\] "
  fi
}

ps1_git()
{
  local branch="" sha1="" line="" attr="" color=0

  shopt -s extglob # Important, for our nice matchers :)

  command -v git >/dev/null 2>&1 || {
    printf " \033[1;37m\033[41m[git not found]\033[m "
    return 0
  }

  branch=$(git symbolic-ref -q HEAD 2>/dev/null) || return 0 # Not in git repo.
  branch=${branch##refs/heads/}

  # Now we display the branch.
  sha1=$(git rev-parse --short --quiet HEAD)

  case "${branch:-"(no branch)"}" in
   production|prod) attr="1;37m\033[" ; color=41 ;; # red
   master|deploy)   color=31                     ;; # red
   stage|staging)   color=33                     ;; # yellow
   dev|develop|development) color=34             ;; # blue
   next)            color=36                     ;; # gray
   *)
     if [[ -n "${branch}" ]] ; then # Feature Branch :)
       color=32 # green
     else
       color=0 # reset
     fi
     ;;
  esac

  [[ $color -gt 0 ]] &&
    printf "\[\033[${attr}${color}m\](git:${branch}$(ps1_git_status):$sha1)\[\033[0m\] "
}

ps1_git_status()
{
  local git_status="$(git status 2>/dev/null)"

  [[ "${git_status}" = *deleted* ]]                    && printf "%s" "-"
  [[ "${git_status}" = *Untracked[[:space:]]files:* ]] && printf "%s" "+"
  [[ "${git_status}" = *modified:* ]]                  && printf "%s" "*"
}

ps1_rvm()
{
  command -v rvm-prompt >/dev/null 2>&1
}

ps1_update()
{
  local prompt_char='$' separator="\n" notime=0

  (( $UID == 0 )) && prompt_char='#'

  while [[ $# -gt 0 ]] ; do
    local token="$1" ; shift

    case "$token" in
      --trace)
        export PS4="+ \${BASH_SOURCE##\${rvm_path:-}} : \${FUNCNAME[0]:+\${FUNCNAME[0]}()}  \${LINENO} > "
        set -o xtrace
        ;;
      --prompt)
        prompt_char="$1"
        shift
        ;;
      --noseparator)
        separator=""
        ;;
      --separator)
        separator="$1"
        shift
        ;;
      --notime)
        notime=1
        ;;
      *)
        true # Ignore everything else.
        ;;
    esac
  done

  if [[ $VIRTUAL_ENV ]]; then
    venv="(${VIRTUAL_ENV##*/})"
  else
    venv=''
  fi

  if (( notime > 0 )) ; then
    PS1="$(ps1_titlebar)$(ps1_identity)$(ps1_git)$(ps1_rvm)${venv}${separator}${prompt_char} "
  else
    PS1="$(ps1_titlebar)\D{%H:%M:%S} $(ps1_identity)$(ps1_git)${venv}$(ps1_rvm)${separator}${prompt_char} "
  fi
}

ps2_set()
{
  PS2="  \[\033[0;40m\]\[\033[0;33m\]> \[\033[1;37m\]\[\033[1m\]"
}

ps4_set()
{
  export PS4="+ \${BASH_SOURCE##\${rvm_path:-}} : \${FUNCNAME[0]:+\${FUNCNAME[0]}()}  \${LINENO} > "
}

# WARNING:  This clobbers your PROMPT_COMMAND so if you need to write your own, call
#           ps1_update within your PROMPT_COMMAND with the same arguments you pass
#           to ps1_set
#
# The PROMPT_COMMAND is used to help the prompt work if the separator is not a new line.
# In the event that the separtor is not a new line, the prompt line may become distored if
# you add or delete a certian number of characters, making the string wider than the
# $COLUMNS + len(your_input_line).
# This orginally was done with callbacks within the PS1 to add in things like the git
# commit, but this results in the PS1 being of an unknown width which results in the prompt
# being distored if you add or remove a certain number of characters. To work around this
# it now uses the PROMPT_COMMAND callback to re-set the PS1 with a known width of chracters
# each time a new command is entered. see PROMPT_COMMAND for more details.
#
ps1_set()
{
  PROMPT_COMMAND="ps1_update $@"
}

ps1_set

function slknife() { knife "$@" -c ~/.chef/knife.rb_SL ;}
function sjcknife() { knife "$@" -c ~/.chef/knife.rb_SJC ;}

function allknife() {
  echo SJC ...
  knife "$@" -c ~/.chef/knife.rb_SJC
  if [ $? -ne 0 ]; then
    echo SJC failed
    return 1
  fi
  echo SoftLayer ...
  knife "$@" -c ~/.chef/knife.rb_SL
  if [ $? -ne 0 ]; then
    echo SL failed
    return 1
  fi
  echo done.
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
