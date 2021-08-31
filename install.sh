#!/bin/sh
echo Installing Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask sublime-text
brew install --cask google-chrome
brew install dockutil
brew install --cask slack
brew install --cask firefox

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
dockutil --add '/Applications/Google Chrome.app'
dockutil --add '/Applications/Sublime Text.app'

echo Disabling Handoff
sudo -u $(whoami) defaults write "$HOME/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist" ActivityAdvertisingAllowed -bool no
sudo -u $(whoami) defaults write "$HOME/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist" ActivityReceivingAllowed -bool no