#!/bin/bash

# Install Caskroom
brew tap caskroom/cask
brew tap caskroom/versions

# Install packages
apps=(
    lastpass
    google-backup-and-sync
    dash
    firefox
    firefox-nightly
    spotify
    keybase
    kitty
    visual-studio-code
    linein
    telegram-desktop
    minecraft
    discord
    macs-fan-control
    adobe-creative-cloud
    authy
    bartender
    alfred
    skype
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package