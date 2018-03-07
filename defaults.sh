

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Frequent Update Checks
defaults write com.assple.SoftwareUpdate ScheduleFrequency -int 1

# Dont track search Safari
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable dashboard, it's never used
defaults write com.apple.dashboard mcx-disabled -bool true

# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0

# Minimize into dock icon
defaults write com.apple.dock minimize-to-application -bool true

defaults write com.apple.dock tilesize -int 46
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock orientation -string 'left'
defaults write com.apple.dock enable-spring-load-actions-on-all-items true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock QuitFinder -bool true
defaults write com.apple.dock size-immutable -bool true

defaults write com.apple.finder FXPreferredViewStyle -string 'clmv'
defaults write com.apple.finder FXPreferredSearchViewStyle -string 'Nlsv'

defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false
defaults write com.apple.loginwindow TALLogoutSavesState -bool false


defaults write com.apple.PhotoBooth EnableDebugMenu -bool true

defaults write NSGlobalDomain AppleInterfaceTheme -string 'Dark'
defaults write com.apple.Spotlight AppleInterfaceStyle -string 'Dark'

defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true


defaults write com.apple.screencapture location -string "${HOME}/Desktop/Screenshots"




defaults write -g AppleLanguages -array "en" "fr"
defaults write -g AppleLocale -string "en_US@currency=USD"
defaults write -g AppleMeasurementUnits -string "Meters"
defaults write -g AppleMetricUnits -bool true