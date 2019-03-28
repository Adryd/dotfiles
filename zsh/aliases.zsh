alias ssh='TERM=xterm-256color ssh'
alias ls='ls -a --color'

alias n='nano'

alias emacs='vim' 
alias nvim='vim'
alias vi='vim'
alias v='vim'

alias rm="rm -rf -I"
alias rmf="rm -rf"

alias x+="chmod +x"

alias ..="cd .."
alias cd..="cd .."

alias dir="ls"
alias cls="clear"
alias nfetch="neofetch"
alias cask="brew cask"

alias pipesbig="pipes.sh -p 5 -r 6000 -R"
alias pipes="pipes.sh -p 5 -r 1500 -R"

alias yt-dl="youtube-dl"
alias yt-dl-mp3="youtube-dl --extract-audio --audio-format mp3"

alias update="cd ~; brew upgrade; cask upgrade; npm upgrade -g"

tomp3() {
  ffmpeg -i $1 -vn -ar 44100 -ac 2 -ab 192k -f mp3 $2
}

