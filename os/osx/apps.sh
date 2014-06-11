# 
# Application installer (via brew-cask)
# 

# Who am i
user=`whoami`
appdir="/Users/$user/Applications"

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

# Install homebrew-cask
brew tap phinze/homebrew-cask
brew install brew-cask

# Install osx apps

brew cask install --appdir=$appdir quicklook-json
# brew cask install --appdir=$appdir google-chrome
brew cask install --appdir=$appdir qlprettypatch
brew cask install --appdir=$appdir one-password
brew cask install --appdir=$appdir transmission
brew cask install --appdir=$appdir sublime-text
brew cask install --appdir=$appdir qlcolorcode
brew cask install --appdir=$appdir screenflick
brew cask install --appdir=$appdir app-cleaner
brew cask install --appdir=$appdir rescue-time
brew cask install --appdir=$appdir virtualbox
brew cask install --appdir=$appdir qlmarkdown
brew cask install --appdir=$appdir qlstephen
brew cask install --appdir=$appdir transmit
brew cask install --appdir=$appdir firefox
# brew cask install --appdir=$appdir spotify
# brew cask install --appdir=$appdir dropbox
brew cask install --appdir=$appdir vagrant
brew cask install --appdir=$appdir nv-alt
brew cask install --appdir=$appdir iterm2
brew cask install --appdir=$appdir shiori
brew cask install --appdir=$appdir skype
brew cask install --appdir=$appdir f-lux
brew cask install --appdir=$appdir flash
brew cask install --appdir=$appdir tower
# brew cask install --appdir=$appdir adium
brew cask install --appdir=$appdir arq
brew cask install --appdir=$appdir vlc

# Modify Alfreds search path to work with cask
brew cask alfred link

# Remove outdated versions from the cellar
brew cleanup

exit 0
