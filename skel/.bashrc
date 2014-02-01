#!/bin/bash
# Personal ~/.bashrc
# Prompt and options specific to bash.
# Matthew Nelson <mnelson@vitalvector.com>

# Extended pathname expansion
shopt -s extglob

# Skip the rest if not running interactively
if [ -z "$PS1" ]; then return; fi

# Login shells evaluate this file through ~/.profile.
# Non-login shells inherit exported variables from ~/.profile via
# parent login shell, override PS1, and evaluate ~/.bashrc directly.
# Alias and shopt settings are not inherited and must be repeated.

# Evaluate global bashrc
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

# Fix delete on the Mac
bind '"\e[3~": delete-char'

# Disable auto-logout
# All workstations have locking screens
unset TMOUT

# Check window size after a process exits
shopt -s checkwinsize

# Enable color support
if [ "$TERM" != dumb ]; then

  # ls
  if command -v dircolors >/dev/null; then
    # GNU Coreutils (presumably Linux)
    eval "`dircolors -b "$HOME/.dircolors"`"
    alias ls="ls --color=auto"
  else
    # BSD (and Mac OS)
    alias ls="ls -G"
  fi

  # grep
  alias grep="grep --color=auto"
  alias fgrep="fgrep --color=auto"
  alias egrep="egrep --color=auto"

  # Prompt
  PS1='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ '

else
  # Dumb terminal prompt
  PS1='\u@\h:\w\$ '
fi

# If running in an xterm, update window title
if [[ "$TERM" == xterm* || "$TERM" == rxvt* ]]; then
  # \e]0;string\a   - xterm command to change window and icon title
  # ${HOSTNAME/.*/} - The hostname up to first period, just like '\h' in PS1
  # ${PWD/#$HOME/~} - Home directory replaced with ~, matching from beginning
  # Mac OS 10.6 seems to have trouble interpreting "\e"
  PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME/.*/}:${PWD/#$HOME/~}\a"'
fi

# Bash history options
shopt -s histappend
HISTSIZE=1000
HISTCONTROL="ignorespace:erasedups"
HISTIGNORE="[bf]g:exit"
HISTFILESIZE=10000

# Add ~/.rbenv/shims to PATH
if command -v rbenv >/dev/null; then
  eval "$(rbenv init -)"
fi

# Evaluate local aliases, useful for machine-specific commands
if [ -f $HOME/.aliases ]; then
  source $HOME/.aliases
fi
