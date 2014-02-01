#!/bin/sh
# Install personal profile.
# Matthew Nelson <mnelson@vitalvector.com>

warn() {
  echo "$@" 1>&2
}

download() {
  if command -v curl >/dev/null; then
    curl -fsSL $1 || exit 1
  elif command -v wget >/dev/null; then
    wget -nv -O - $1 || exit 1
  else
    warn 'Not found: curl or wget'
    exit 1
  fi
}

download https://github.com/mdavidn/profile/archive/master.tar.gz \
  | tar xzC $HOME --strip-components 2
