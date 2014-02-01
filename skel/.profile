#!/bin/sh
# Personal ~/.profile
# Global environment variables.
# Matthew Nelson <mnelson@vitalvector.com>

pushpath() {
  local path pad
  eval path=\"\$$1\"
  pad=":$path:"
  if [ -d "$2" -a "$pad" == "${pad%":$2:"*}" ]; then
    eval $1=\"$2${path:+":$path"}\"
  fi
}

# man ignores /etc without trailing colon.
if [ -z "$MANPATH" ]; then MANPATH=: ; fi

# Homebrew
pushpath PATH /usr/local/bin
pushpath PATH /usr/local/share/python
pushpath MANPATH /usr/local/share/man

# Personal bin
pushpath PATH "$HOME/bin"
pushpath PATH "$HOME/.rbenv/bin"
pushpath MANPATH "$HOME/man"

export PATH MANPATH

# Symlink to ssh-agent (for tmux sessions)
if [ -z "$TMUX" -a \
  -n "$SSH_TTY" -a -n "$SSH_AUTH_SOCK" -a \
  "$SSH_AUTH_SOCK" != "$HOME/.ssh/agent" \
  ]; then
  ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/agent"
  SSH_AUTH_SOCK="$HOME/.ssh/agent"
  export SSH_AUTH_SOCK
fi

# Set editor to vi
for editor in vim vi; do
  if command -v "$editor" >/dev/null; then
    export VISUAL EDITOR
    VISUAL="$editor"
    EDITOR="$editor"
    break
  fi
done

# Set pager to less
if command -v less >/dev/null; then
  PAGER=less; export PAGER
fi

# Configure sh to evaluate ~/.shrc
if [ -f "$HOME/.shrc" ]; then
  ENV="$HOME/.shrc"; export ENV
fi

# Evaluate ~/.bashrc for login bash shells
if [ -n "$BASH" -a -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

# Evaluate local profile, useful for appending to path
if [ -f "$HOME/.local_profile" ]; then
  . "$HOME/.local_profile"
fi

unset -f pushpath
