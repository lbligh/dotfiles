#!/usr/bin/env bash

# Install Brew Packages

brew install python

echo "Installing other brew stuff..."
brew install tree
brew install wget
brew install trash
brew install svn
brew install mackup
brew install node
brew install docker

echo "Cleaning up brew"
brew cleanup

echo "Installing homebrew cask"
brew install caskroom/cask/brew-cask

# Install Source Code Pro Font
brew tap homebrew/cask-fonts
brew cask install font-source-code-pro

ps=(
  alfred
  bartender
  dropbox
  google-chrome
  spotify
  iterm2
  virtualbox
  transmission
  zoomus
  onepassword
  discord
  gimp
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew install --cask --appdir="/Applications" ${apps[@]}

brew cask alfred link

brew cask cleanup
brew cleanup