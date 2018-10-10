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
