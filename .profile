#!/bin/sh
# Personal ~/.profile
# Global environment variables.
# Matthew Nelson <mnelson@vitalvector.com>

# Homebrew
if [ -d /usr/local/bin ]; then PATH=/usr/local/bin:$PATH; fi
if [ -d /usr/local/share/python ]; then PATH=/usr/local/share/python:$PATH; fi
if [ -d /usr/local/share/man ]; then MANPATH=/usr/local/share/man:$MANPATH; fi

# Personal bin
if [ -d $HOME/bin ]; then PATH=$HOME/bin:$PATH; fi
if [ -d $HOME/man ]; then MANPATH=$HOME/man:$MANPATH; fi
if [ -d $HOME/.rbenv ]; then PATH=$HOME/.rbenv/bin:$PATH; fi

export PATH
export MANPATH

# Symlink to ssh-agent (for tmux sessions)
if [ -z "$TMUX" -a ! -z "$SSH_TTY" -a \
    ! -z "$SSH_AUTH_SOCK" -a \
    "$SSH_AUTH_SOCK" != "$HOME/.ssh/agent" ]; then
  ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/agent"
  SSH_AUTH_SOCK="$HOME/.ssh/agent"
  export SSH_AUTH_SOCK
fi

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
