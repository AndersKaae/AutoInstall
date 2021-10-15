#!/bin/sh
echo Installing Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile eval "$(/opt/homebrew/bin/brew shellenv)"
brew install --cask sublime-text
brew install --cask google-chrome
brew install dockutil
brew install --cask slack
brew install --cask firefox

echo Remove big default apps
sudo rm -rf /Applications/GarageBand.app
sudo rm -rf /Applications/iMovie.app

echo Remove dock items
dockutil --remove 'Safari'
dockutil --remove 'Messages'
dockutil --remove 'Mail'
dockutil --remove 'Maps'
dockutil --remove 'Photos'
dockutil --remove 'FaceTime'
dockutil --remove 'TV'
dockutil --remove 'Podcasts'
dockutil --remove 'App Store'
dockutil --remove 'System Preferences'
dockutil --remove 'Keynote'
dockutil --remove 'Numbers'
dockutil --remove 'Pages'
dockutil --add '/Applications/Google Chrome.app'
dockutil --add '/Applications/Sublime Text.app'

echo Disabling Handoff
sudo -u $(whoami) defaults write "$HOME/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist" ActivityAdvertisingAllowed -bool no
sudo -u $(whoami) defaults write "$HOME/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist" ActivityReceivingAllowed -bool no

echo Diable recent items in Dock
defaults write com.apple.dock show-recents -bool FALSE

echo Updating Mac
sudo softwareupdate -i -a
