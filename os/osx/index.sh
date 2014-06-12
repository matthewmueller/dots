#!/usr/bin/env bash

set -e

# modules
source "$lib/symlink/index.sh"

# paths
osx="$os/osx"

# Only run if on a Mac
if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi

# Run each program
# sh "$osx/binaries.sh"
sh "$osx/defaults.sh"
# sh "$dirname/apps.sh"

# Symlink the profile
if [[ ! -e "$HOME/.bash_profile" ]]; then
  symlink "$osx/profile.sh" "$HOME/.bash_profile"
else
  echo "$HOME/.bash_profile already exists. remove and run again."
fi
