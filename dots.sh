#!/usr/bin/env bash

version="0.0.1"

# paths
export dirname=$(dirname "$(readlink -f "$0")")
export lib="$dirname/lib"
export os="$dirname/os"

# usage info
usage() {
  cat <<EOF

  Usage: dots [options] [command] [args ...]

  Options:

    -v, --version           Get the version
    -h, --help              This message

  Commands:

    reload                  Reload the dotfiles
    boot <os>               Bootstrap the given operating system
    update                  Update dots

EOF
}

# Bootstrap the OS
boot() {
  if [[ -e "$os/$1/index.sh" ]]; then
    sh "$os/$1/index.sh"
  else
    echo "boot: could not find \"$1\""
    exit 1
  fi
}

# update either dots or OS
update() {
  if [[ -e "$os/$1/index.sh" ]]; then
    sh "$os/$1/update.sh"
  elif [[ "$1" == "dots" ]]; then
    updatedots
  else
    echo "update: could not find \"$1\""
    exit 1
  fi
}

# update dots(1) via git clone
updatedots() {
  cd /tmp \
    && echo "... updating" \
    && git clone --depth 1 git://github.com/matthewmueller/dots.git \
    && cd dots \
    && make install \
    && echo "... updated to $(dots --version)"
  exit
}

# parse options
while [[ "$1" =~ ^- ]]; do
  case $1 in
    -v | --version )
      echo $version
      exit
      ;;
    -h | --help )
      usage
      exit
      ;;
  esac
  shift
done

# run command
case $1 in
  reload )
    source "$HOME/.bash_profile"
    ;;
  boot )
    boot $2
    exit
    ;;
  update )
    update $2
    exit
    ;;
  *)
    usage
    exit
    ;;
esac

