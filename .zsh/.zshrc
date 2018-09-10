export PATH="$HOME/bin:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH" # Basic PATH shit
export ADRYDDOTFILES="$HOME/.ashell"
export ZSH="$HOME/.ashell/.zsh/oh-my-zsh" # oh my zsh wants this
export NVM_DIR="$HOME/.nvm"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
#export JAVA_HOME=`/usr/libexec/java_home`

plugins=(
  git
)

source "${ADRYDDOTFILES}/.zsh/oh-my-zsh/oh-my-zsh.sh"
source "${ADRYDDOTFILES}/.zsh/iterm2_shell_integration.zsh"
source "${ADRYDDOTFILES}/theme_settings_default.zsh"
source "${ADRYDDOTFILES}/theme_settings.zsh"

EDITOR='vim'
JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home'

# GraalVM
export GRAALVM_HOME=~/.path/GraalVM/Contents/Home
export PATH=$GRAALVM_HOME/bin:$PATH

HISTSIZE=10000
SAVEHIST=10000
[[ $TMUX ]] && export ISTMUX="1"

alias rl='source ~/.zshrc'
alias sync='source ~/.ashell/theme_settings.zsh && resettheme'

source "${ADRYDDOTFILES}/.zsh/aliases.zsh"
source "${ADRYDDOTFILES}/private/keys.zsh"
source "${ADRYDDOTFILES}/.zsh/personal.zsh"

source "${ADRYDDOTFILES}/themes.zsh"
source "${ADRYDDOTFILES}/.zsh/fuckery.zsh"

alias motd="phant"

# Slows down load time

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

resettheme
clear

segments="${ADRYDDOTFILES}/.iterm2/segments.zsh"

motd

#nfetch
#it2attention fireworks && sleep 1

#it2setkeylabel set F1 "$USERNAME@$(hostname)"
#it2setkeylabel set F2 "$($segments date)"
#it2setkeylabel set F3 "$($segments time)"
#it2setkeylabel set F4 "$($segments battery)"
#it2setkeylabel set F5 "$($segments uptime)"