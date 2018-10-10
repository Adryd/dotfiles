if [[ $TMUX ]]; then
  echo -e -n "\033Ptmux;\033\033\033]1337;SetProfile=Adryd - Dynamic\007\033\\"
else
  echo -e -n "\033]50;SetProfile=Adryd - Dynamic\a"
fi

artheme_callback() {
    # $1 = PROMPT VARIABLE
    # $2 = OUT TO ECHO
    echo -e -n "$2"
}

alias artheme="node $ADRYDDOTFILES/themer/theme.js"
# | artheme_callback
alias arprefs="node $ADRYDDOTFILES/themer/prefs.js"

