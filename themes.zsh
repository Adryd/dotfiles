resettheme() {
  prompt $PROMPTTYPE
  echo "FONT=\"${FONT}\";COLORS=\"${COLORS}\";PREFS=\"${PREFS}\";PROMPTTYPE=\"${PROMPTTYPE}\";" >! $ADRYDDOTFILES/theme_settings.zsh
  node $ADRYDDOTFILES/iterm2/main.js
}

prefs() {
  if [[ $1 == "vga" || $1 == "1" ]]; then
    PREFS="vga"
  elif [[ $1 == "asd" || $1 == "2" ]]; then
    PREFS="default"
  else 
    PREFS="default"
  fi
  resettheme
}

font() {
  if [[ $1 == "roboto" || $1 == "1" ]]; then
    FONT="roboto"
  elif [[ $1 == "ubuntu" || $1 == "2" ]]; then
    FONT="ubuntu"
  elif [[ $1 == "monaco" || $1 == "3" ]]; then
    FONT="monaco"
  elif [[ $1 == "vga" || $1 == "4" ]]; then
    FONT="vga"
  else 
    FONT="pragmataPro"
  fi
  resettheme
}

color() {
  if [[ $1 == "shells" || $1 == "1" ]]; then
    COLORS="shells"
  elif [[ $1 == "soda" || $1 == "2" ]]; then
    COLORS="monokaiSoda"
  elif [[ $1 == "gloom" || $1 == "3" ]]; then
    COLORS="gloom"
  elif [[ $1 == "default" || $1 == "4" ]]; then
    COLORS="default"
  elif [[ $1 == "gloomssoda" || $1 == "5" ]]; then
    COLORS="gloomSoda"
  elif [[ $1 == "pure" || $1 == "6" ]]; then
    COLORS="pure"
  else 
    COLORS="monokai"
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
  elif [[ $1 == "bash" || $1 == "3" ]]; then
    PROMPTTYPE="ghost"
    source "${ADRYDDOTFILES}/zsh/themes/ghost.zsh-theme"
  elif [[ $1 == "minimalist" || $1 == "4" ]]; then
    PROMPTTYPE="minimal"
    source "${ADRYDDOTFILES}/zsh/themes/extralight.zsh-theme"
  else
    PROMPTTYPE="powerline"
    source "${ADRYDDOTFILES}/zsh/themes/agnoster-adryd.zsh-theme"
  fi
  echo "FONT=\"${FONT}\";COLORS=\"${COLORS}\";PREFS=\"${PREFS}\";PROMPTTYPE=\"${PROMPTTYPE}\";" >! ~/.ashell/theme_settings.zsh
}




# TO BE DONE
# Language: C or zsh 
#           zsh may need to be used since setting the prompt and shell variables can be done easily in that,
#           the source command will also need to be used to load the prompt generators into the shell.
#           C may be needed for JSON parsing and easier string manipulation.
#           perhaps use zsh to call C and then C will return information that zsh can use to apply themes and 
#           set variables.
#
# Far future features:
#           ability to modify themes for vim and vscode
#           pass background color to tmux to make status line blend in

# APPLY COMMANDS
# apply changes to term
# arguments:
# "--temp" will set the theme back to normal after a reload
# "--default" will set the following theme as default, being applied whenever the reset command is run

# COLOR
# Changes iTerm2 dynamic profile with a set of colors defined in a configuration file
# $ artheme color gloom
# $ artheme color vga --temp
# $ artheme color monokai --default 

# FONT
# Changes iTerm2 dynamic profile with a font defined in a configuration file
# $ artheme font monaco
# $ artheme font vga --temp
# $ artheme font pragmatapro --default

# PROMPT
# Changes zsh prompt to one in the themes folder
# $ artheme prompt bash
# $ artheme prompt msdos --temp
# $ artheme prompt powerline --default

# RELOAD
# Applies themes if they were not previously applied, regenerates iTerm2 dynamic profile
# Will reset themes applied with --temp to that applied before it
# $ artheme reload 

# RESET
# Resets themes to those stored in default profile
# $ artheme reload 

