resettheme() {
  prompt $PROMPTTYPE
  echo "FONT=\"${FONT}\";COLORS=\"${COLORS}\";PROMPTTYPE=\"${PROMPTTYPE}\";" >! ~/.ashell/theme_settings.zsh
  node $ADRYDDOTFILES/iterm2/main.js
}


font() {
  if [[ $1 == "roboto" || $1 == "1" ]]; then
    FONT="Roboto"
  elif [[ $1 == "ubuntu" || $1 == "2" ]]; then
    FONT="Ubuntu"
  else 
    FONT="PragmataPro"
  fi
  resettheme
}

color() {
  if [[ $1 == "shells" || $1 == "1" ]]; then
    COLORS="Shells"
  elif [[ $1 == "soda" || $1 == "2" ]]; then
    COLORS="MonokaiSoda"
  elif [[ $1 == "gloom" || $1 == "3" ]]; then
    COLORS="Gloom"
  elif [[ $1 == "default" || $1 == "4" ]]; then
    COLORS="default"
  elif [[ $1 == "gloomssoda" || $1 == "5" ]]; then
    COLORS="GloomSoda"
  elif [[ $1 == "pure" || $1 == "6" ]]; then
    COLORS="Pure"
  else 
    COLORS="Monokai"
  fi
  resettheme
}


prompt() {
  if [[ $1 == "basic" || $1 == "1" ]]; then
    PROMPTTYPE="basic"
    source "${ADRYDDOTFILES}/zsh/themes/basic.zsh-theme"
  elif [[ $1 == "lite" || $1 == "2" ]]; then
    PROMPTTYPE="lite"
    source "${ADRYDDOTFILES}/zsh/themes/minimal.zsh-theme"
  elif [[ $1 == "ghost" || $1 == "3" ]]; then
    PROMPTTYPE="ghost"
    source "${ADRYDDOTFILES}/zsh/themes/ghost.zsh-theme"
  elif [[ $1 == "minimalist" || $1 == "4" ]]; then
    PROMPTTYPE="minimal"
    source "${ADRYDDOTFILES}/zsh/themes/extralight.zsh-theme"
  else
    PROMPTTYPE="powerline"
    source "${ADRYDDOTFILES}/zsh/themes/agnoster-adryd.zsh-theme"
  fi
  echo "FONT=\"${FONT}\";COLORS=\"${COLORS}\";PROMPTTYPE=\"${PROMPTTYPE}\";" >! ~/.ashell/theme_settings.zsh
}


  if [[ $TMUX ]]; then
  echo -e -n "\033Ptmux;\033\033\033]1337;SetProfile=Adryd - Dynamic\007\033\\"
  else
  echo -e -n "\033]50;SetProfile=Adryd - Dynamic\a"
  fi