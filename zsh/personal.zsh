desktop () {
  if [[ $1 == "hide" || $1 == "disable" ]]; then
    defaults write com.apple.finder CreateDesktop -bool false && killall Finder
  else
    defaults write com.apple.finder CreateDesktop -bool true && killall Finder
  fi
}

hfiles () {
  if [[ $1 == "show" ]]; then
    defaults write com.apple.finder AppleShowAllFiles -bool true && defaults write NSGlobalDomain AppleShowAllExtensions -bool true && killall Finder
  else
    defaults write com.apple.finder AppleShowAllFiles -bool false && defaults write NSGlobalDomain AppleShowAllExtensions -bool false && killall Finder
  fi
}

grayscale () {
  if [[ $1 == "on" || $1 == "enable" ]]; then
    defaults write com.apple.universalaccess grayscale -bool yes;defaults write com.apple.CoreGraphics DisplayUseForcedGray -bool yes;launchctl unload /System/Library/LaunchAgents/com.apple.universalaccessd.plist;launchctl load /System/Library/LaunchAgents/com.apple.universalaccessd.plist
  else
    defaults write com.apple.universalaccess grayscale -bool no;defaults write com.apple.CoreGraphics DisplayUseForcedGray -bool no;launchctl unload /System/Library/LaunchAgents/com.apple.universalaccessd.plist;launchctl load /System/Library/LaunchAgents/com.apple.universalaccessd.plist
  fi
}



