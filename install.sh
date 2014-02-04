#!/bin/sh
# Install personal profile.
# Matthew Nelson <mnelson@vitalvector.com>

dst_dir="${PREFIX:-$HOME}"
src_dir="$(mktemp -d "$dst_dir/.profile.XXXX")"

warn() {
  echo "$@" 1>&2
}

download() {
  if command -v curl >/dev/null; then
    curl -fsSL -- "$1" || exit 1
  elif command -v wget >/dev/null; then
    wget -nv -O - -- "$1" || exit 1
  else
    warn 'Not found: curl or wget'
    exit 1
  fi
}

each_file() {
  local dir file
  for dir; do
    find "$dir" -type f | while read file; do
      echo "${file#$dir/}"
    done
  done
}

install() {
  local file src dst backup
  while read file; do
    src="$src_dir/$file"
    dst="$dst_dir/$file"
    mkdir -p -- "${dst%/*}"
    if [ -e "$dst" ] && ! cmp -s -- "$src" "$dst"; then
      backup="$(mktemp "$dst.bak.XXXX")"
      mv -- "$dst" "$backup"
      case "$file" in
        .ssh/authorized_keys)
          warn "Merging $file"
          sort -u "$src" "$backup" > "$dst"
          ;;
        *)
          warn "Backing up $file"
          mv -- "$src" "$dst"
      esac
    else
      mv -- "$src" "$dst"
    fi
  done
}

download https://github.com/mdavidn/profile/archive/master.tar.gz \
  | tar xzC "$src_dir" --strip-components 2
each_file "$src_dir" | install
rm -rf "$src_dir"
