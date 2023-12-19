#!/usr/bin/env bash

# Install Brew Packages
echo "Installing Python"
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


packages=(
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
  visual-studio-code
)


echo "installing apps with Cask..."

for i in ${packages[*]} 
do 
 brew install --cask "$i"
 #echo $i
done


#brew alfred link

brew cleanup
