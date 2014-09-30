# kill on error
set -e

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

# update brew packages
brew update
brew upgrade

# cleanup
brew cleanup
