#!/bin/bash
# Personal ~/.bash_profile
# Matthew Nelson <mnelson@vitalvector.com>

# Bash ignores ~/.profile if any software appends to ~/.bash_profile.
if [ -f "$HOME/.profile" ]; then
  source "$HOME/.profile"
fi

