


#alias gray='defaults write com.apple.universalaccess grayscale -bool yes;defaults write com.apple.CoreGraphics DisplayUseForcedGray -bool yes;launchctl unload /System/Library/LaunchAgents/com.apple.universalaccessd.plist;launchctl load /System/Library/LaunchAgents/com.apple.universalaccessd.plist'
#alias color='defaults write com.apple.universalaccess grayscale -bool no;defaults write com.apple.CoreGraphics DisplayUseForcedGray -bool no;launchctl unload /System/Library/LaunchAgents/com.apple.universalaccessd.plist;launchctl load /System/Library/LaunchAgents/com.apple.universalaccessd.plist;'

#alias shfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && defaults write NSGlobalDomain AppleShowAllExtensions -bool true && killall Finder"
#alias hhfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && defaults write NSGlobalDomain AppleShowAllExtensions -bool false && killall Finder"

#alias hdesk="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
#alias sdesk="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

desktop () {
  if [[ $1 == "hide" ]]; then
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

tidy () {
  echo Beginning clean up!

  echo Rebuilding Launch Services...
  /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
  echo Clearing logs...
  sudo /bin/rm -rf /Library/Logs/*
  sudo /bin/rm -rf ~/Library/Logs/*
  echo Clearing Caches...
  sudo /bin/rm -rf ~/Library/Caches/*
  sudo /bin/rm -rf /Library/Caches/*
  echo Flushing DNS Cache...
  sudo dscacheutil -flushcache
  sudo killall -HUP mDNSResponder
  echo Forcing automated maintainance...
  sudo periodic daily
  sudo periodic weekly
  sudo periodic monthly
  echo Removing mail
  /bin/rm -rf ~/Library/Containers/com.apple.mail/Data/Library/Mail 
  echo Removing webkit garbage
  /bin/rm -rf ~/Library/Containers/com.apple.Safari/Data/Library/Caches/com.apple.Safari/WebKitCache 
  echo Running misc tasks...
  sudo /usr/libexec/xpchelper --rebuild-cache |> /dev/null
  sudo /bin/rm -f /private/var/db/BootCache.playlist > /dev/null
  sudo update_dyld_shared_cache -root / -force |> /dev/null
  echo Rebuilding Kernel Extensions
  sudo touch /System/Library/Extensions && sudo kextcache -u / |> /dev/null
  echo Removing Shell Histories...
  /bin/rm ~/.bash_history |> /dev/null
  /bin/rm ~/.sh_history |> /dev/null
  /bin/rm ~/.zsh_history |> /dev/null
  /bin/rm ~/.node_repl_history |> /dev/null
  /bin/rm -rf ~/.bash_sessions |> /dev/null
  echo Restarting System Services...
  killall Finder
  killall Dock
  echo Committing suicide
  sudo /bin/rm -rf /private/var/folders/11/hwsqlhgn0fb60wb7lxvx_bj40000gn/C/*
  sudo /bin/rm -rf /private/var/folders/11/hwsqlhgn0fb60wb7lxvx_bj40000gn/T/*
  echo Preparing to Restart...
  echo See you on the other end
  killall -HUP WindowServer
  sudo reboot
}

P="\\e[$(( ( RANDOM % 6 )  + 31 ))m"


phant() {
    P="\\e[$(( ( RANDOM % 6 )  + 31 ))m"
    echo ""
    echo  "$P         ████████    ███████      "
    echo  "$P    ██████████████████████  ██    "
    echo  "$P    ██████████████████████████    "
    echo  "$P  ██████████████████████████████  "
    echo  "$P  ██████████████████████\e[39m██$P  ████  "
    echo  "$P  ████████████████████  \e[39m██$P    ██  "
    echo  "$P  ████████████████████    \e[39m██$P  ██  "
    echo  "$P  ██  ████████████            ██  "
    echo  "$P      ████    ████          ██    "
    echo  "$P      ████    ████                "
    echo  ""
}
phantM() {
    
    echo -e ""
    echo -e "\e[31m         MMMMMMMM    MMMMMMM      "
    echo -e "\e[31m    MMMMMMMMMMMMMMMMMMMMMM  MM    "
    echo -e "\e[31m    MMMMMMMMMMMMMMMMMMMMMMMMMM    "
    echo -e "\e[31m  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  "
    echo -e "\e[31m  MMMMMMMMMMMMMMMMMMMMMM\e[39mMM\e[31m  MMMM  "
    echo -e "\e[31m  MMMMMMMMMMMMMMMMMMMM  \e[39mMM\e[31m    MM  "
    echo -e "\e[31m  MMMMMMMMMMMMMMMMMMMM    \e[39mMM\e[31m  MM  "
    echo -e "\e[31m  MM  MMMMMMMMMMMM            MM  "
    echo -e "\e[31m      MMMM    MMMM          MM    "
    echo -e "\e[31m      MMMM    MMMM                "
    echo  ""
}