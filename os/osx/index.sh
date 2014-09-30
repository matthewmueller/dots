#!/usr/bin/env bash

set -e

# modules
source "$lib/symlink/index.sh"
source "$lib/is-osx/index.sh"

# Only run if on a Mac
if [ 0 -eq `osx` ]; then
  exit 0
fi

# exit 1
# paths
osx="$os/osx"

# Run each program
sh "$osx/binaries.sh"
sh "$osx/defaults.sh"
sh "$osx/apps.sh"

# Symlink the profile
if [[ ! -e "$HOME/.bash_profile" ]]; then
  symlink "$osx/profile.sh" "$HOME/.bash_profile"
else
  echo "$HOME/.bash_profile already exists. remove and run again."
fi
