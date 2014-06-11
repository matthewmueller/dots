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
if [[ ! -e "$HOME/jazz_profile" ]]; then
  symlink "$osx/profile.sh" "$HOME/jazz_profile"
else
  echo "$HOME/jazz_profile already exists. remove and run again."
fi
