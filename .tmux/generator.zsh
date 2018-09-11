ADRYDDOTFILES="$HOME/.ashell"
source "$ADRYDDOTFILES/theme_settings_default.zsh"
source "$ADRYDDOTFILES/theme_settings.zsh"

if [[ $PROMPTTYPE == "powerline" ]]; then
  $ADRYDDOTFILES/.tmux/themes/powerline.zsh $1 
elif [[ $PROMPTTYPE == "" ]]; then
  $ADRYDDOTFILES/.tmux/themes/basic.zsh $1
else 
  $ADRYDDOTFILES/.tmux/themes/basic.zsh $1
fi