#!/usr/bin/env bash

# version
version="0.0.1"

# usage
function usage {
  cat <<EOF

  Usage: user [options] [command] [user]

  Options:

    -v, --version           Get the version
    -h, --help              This message

  Command:

    add <user>              Add a user
    rm <user>               Remove a user

EOF
}

# Manage users
# 
# Usage: user add matt
# Usage: user rm matt

function user {
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

  # run command
  case $1 in
    add )
      adduser $2
      usermod -a -G sudo $2
      ;;
    rm )
      rmuser $2
      ;;
    *)
      usage
      ;;
  esac
}
export -f user
