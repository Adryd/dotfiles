export PATH=$HOME/bin:/usr/local/bin:$PATH
export JAVA_HOME=`/usr/libexec/java_home`

export ZSH="$HOME/.oh-my-zsh"

export EDITOR='nvim'

HISTSIZE=10000
SAVEHIST=10000

alias ls='ls -a'
alias vim='nvim'
alias yt-dl='youtube-dl'
alias yt-dl-m='youtube-dl --extract-audio'

alias x+="chmod +x"

alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

alias cask='brew cask' # i <3 u cask
alias brwe=brew #typos

alias shfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && defaults write NSGlobalDomain AppleShowAllExtensions -bool true && killall Finder"
alias hhfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && defaults write NSGlobalDomain AppleShowAllExtensions -bool false && killall Finder"
alias hdesk="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias sdesk="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

ZSH_THEME="agnoster-adryd"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
