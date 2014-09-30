# 
# Binary installer
# 

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew
brew update && brew upgrade brew-cask

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Install other useful binaries
brew install graphicsmagick
brew install webkit2png
brew install rename
brew install zopfli
brew install ffmpeg
brew install python
brew install sshfs
brew install tree
brew install zsh
brew install ack
brew install git
brew install hub

# Add osx specific command line tools
if test ! $(which subl); then
  ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
fi

# Install spot
if test ! $(which spot); then
  curl -L https://raw.github.com/guille/spot/master/spot.sh -o /usr/local/bin/spot && chmod +x /usr/local/bin/spot
fi

# Remove outdated versions from the cellar
brew cleanup

exit 0
