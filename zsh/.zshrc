export PATH=$HOME/bin:/usr/local/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/Library/Python/3.6/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export JAVA_HOME=`/usr/libexec/java_home`

export ZSH="$HOME/.oh-my-zsh"

export EDITOR='vim'

HISTSIZE=10000
SAVEHIST=10000

alias ls='ls -a --color'
alias emacs='vim'
alias nvim='vim'
alias vi='vim'
alias v='vim'
alias yt-dl="youtube-dl"
alias yt-dl-m="youtube-dl --extract-audio"
alias rm="rm -i"
alias pipesbig="pipes.sh -p 5 -r 6000 -R"
alias pipes="pipes.sh -p 5 -r 1500 -R"
alias x+="chmod +x"
alias dir="ls"
alias cls="clear"
alias nfetch="neofetch"
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

#source $ZSH/oh-my-zsh.sh
#source ~/Library/Python/3.6/lib/site-packages/powerline/bindings/zsh/powerline.zsh
source $HOME/Library/Python/3.6/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

