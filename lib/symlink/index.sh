#!/usr/bin/env bash

# version
version="0.0.1"

# usage
function usage {
  cat <<EOF

  Usage: symlink /path/to/file /path/to/symlink

  Options:

    -v, --version           Get the version
    -h, --help              This message

EOF
}

# Symlink
# 
# Usage: symlink /path/to/file /path/to/symlink

function symlink {
  # parse options
  while [[ "$1" =~ ^- ]]; do
    case $1 in
      -v | --version )
        echo $version
        ;;
      -h | --help )
        usage
        ;;
    esac
    shift
  done  

  if [[ -e $1 ]] && [[ -n $2 ]]; then
    ln -s $1 $2
  else
    usage
  fi
}
