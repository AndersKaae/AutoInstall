#!/bin/sh
echo Installing Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile eval "$(/opt/homebrew/bin/brew shellenv)"
# Needed commands for the M1 mac
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew upgrade

brew install --cask sublime-text
brew install --cask google-chrome
brew install --cask clickup

# Docutil is failing because no updated. When the fix stop working just install the regular way.
#brew install dockutil
brew tap lotyp/homebrew-formulae
brew install lotyp/formulae/dockutil

brew install --cask slack
brew install --cask firefox
brew install wget

echo Setting Desktop Image
cd /Library
sudo wget https://raw.githubusercontent.com/AndersKaae/AutoInstall/master/image.png
cd $HOME
sudo wget https://raw.githubusercontent.com/AndersKaae/AutoInstall/master/changewallpaper.scpt
osascript changewallpaper.scpt

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
dockutil --remove 'Freeform'
dockutil --remove 'Contacts'
dockutil --add '/Applications/Google Chrome.app'
dockutil --add '/Applications/Sublime Text.app'
dockutil --add '/Applications/Slack.app'

echo Disabling Handoff
sudo -u $(whoami) defaults write "$HOME/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist" ActivityAdvertisingAllowed -bool no
sudo -u $(whoami) defaults write "$HOME/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist" ActivityReceivingAllowed -bool no

echo Diable recent items in Dock
defaults write com.apple.dock show-recents -bool FALSE

echo Updating Mac
sudo softwareupdate -i -a
