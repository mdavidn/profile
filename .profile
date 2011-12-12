#!/bin/sh
# Personal ~/.profile
# Global environment variables.
# Matthew Nelson <mnelson@vitalvector.com>

# Homebrew
if [ -d /usr/local/bin ]; then PATH=/usr/local/bin:$PATH; fi
if [ -d /usr/local/share/man ]; then MANPATH=/usr/local/share/man:$MANPATH; fi

# Personal bin
if [ -d $HOME/bin ]; then PATH=$PATH:$HOME/bin; fi
if [ -d $HOME/man ]; then MANPATH=$MANPATH:$HOME/man; fi

export PATH
export MANPATH

# Set editor to vi
if which vim >/dev/null 2>&1; then
  VISUAL=vim; export VISUAL
  EDITOR=vim; export EDITOR
elif which vi >/dev/null 2>&1; then
  VISUAL=vi; export VISUAL
  EDITOR=vi; export EDITOR
fi

# Set pager to less
if which less >/dev/null 2>&1; then
  PAGER=less; export PAGER
fi

# Configure sh to evaluate ~/.shrc
if [ -f $HOME/.aliases ]; then
  ENV="$HOME/.shrc"; export ENV
fi

# Evaluate ~/.bashrc for login bash shells
if [ -n "$BASH" -a -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

# Evaluate local profile, useful for appending to path
if [ -f $HOME/.local_profile ]; then
  . $HOME/.local_profile
fi
