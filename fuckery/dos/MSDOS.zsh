
echo -e -n "\033]50;SetProfile=VGA\a"
echo -e -n "\033Ptmux;\033\033\033]1337;SetProfile=VGA\007\033\\"
clear
sleep 0.5
if [[ $ISTMUX ]]; then
cat ~/.ashell/fuckery/dos/logoframe3
sleep 0.25
else
~/.iterm2/imgcat ~/.ashell/fuckery/dos/logo.png
sleep 2
fi


DOS_TEXT_BIOSYEAR1=""
DOS_TEXT_BIOSYEAR2=""

DOS_TEXT_MS="MS"
DOS_TEXT_MICROSOFT="Microsoft"
DOS_TEXT_DOSVER="6.22"
DOS_TEXT_DOSYEAR1="1981"
DOS_TEXT_DOSYEAR2="1994"

echo "Being silly since 2002"
sleep 0.05
echo "Press F1 for setup"
sleep 0.05
echo
echo "Phoenix 80386 ROM BIOS PLUS Version 1.10 2714"
sleep 0.05
echo "Copyright (C) 2002-2018 Phoenix Technologies Ltd."
sleep 0.05
echo "All Rights Reserved"
sleep 0.05
echo
echo "362142069341337"
sleep 0.125
echo 
echo "8192M Base Memory, 16348M Extended"
sleep 0.125
echo
afplay ~/.ashell/fuckery/dos/seek.mp3
echo "Starting $DOS_TEXT_MS-DOS..."
sleep 0.125
echo
afplay ~/.ashell/fuckery/dos/boot.mp3
echo -n "HIMEM is testing extended memory..."
sleep 0.5
echo "done."
echo
echo "C:\>C:\DOS\MOUSE.EXE"
sleep 0.05
echo "C:\>C:\DOS\DOSKEY.EXE"
sleep 0.05
echo "C:\>C:\DOS\SMARTDRV.EXE /X"
sleep 0.05
echo "C:\>C:\COMMAND.COM"
sleep 0.05
echo
sleep 0.125
echo "$DOS_TEXT_MICROSOFT(R) $DOS_TEXT_MS-DOS(R) Version $DOS_TEXT_DOSVER\n             (C)Copyright $DOS_TEXT_MICROSOFT Corp $DOS_TEXT_DOSYEAR1-$DOS_TEXT_DOSYEAR2"
echo

build_prompt () {
   echo -n "C:"
   echo -n "$PWD" | sed s:/:\\\\:g | tr a-z A-Z
   echo -n ">"
}
PROMPT='%{%f%b%k%}$(build_prompt)'
sleep 0.25

alias dir="ls -1 -l --color=none | tr a-z A-Z"

exit_dos() {
    echo "exiting..."
    unalias exit
    reset
    source ~/.zshrc
    echo -e -n "\033]50;SetProfile=Adryd - Dynamic\a"
    echo -e -n "\033Ptmux;\033\033\033]1337;SetProfile=Adryd - Dynamic\007\033\\"
}

alias exit="exit_dos"
