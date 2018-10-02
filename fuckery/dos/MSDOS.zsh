clear
echo -e -n "\033]50;SetProfile=VGA\a"
echo -e -n "\033Ptmux;\033\033\033]1337;SetProfile=VGA\007\033\\"
cat ~/.ashell/fuckery/dos/logo
#~/.iterm2/imgcat ./Creative\ Cloud\ Files/120h/Artboard\ 2doslogo.png
echo "Being silly since 2002"
echo "Press F1 for setup"
sleep 0.05
echo
echo "Adryd 80386 ROM BIOS PLUS Version 1.10 2714"
sleep 0.05
echo "Copyright (C) 2002-2018 Adryd Technologies Ltd."
sleep 0.05
echo "All Rights Reserved"
sleep 0.05
echo
sleep 0.05
echo "362142069341337"
echo 
sleep 0.125
echo "8192M Base Memory, 16348M Extended"
echo
afplay ~/.ashell/fuckery/dos/seek.mp3
sleep 0.25
echo "Starting LS-DOS..."
sleep 0.125
echo
afplay ~/.ashell/fuckery/dos/boot.mp3
echo -n "HIMEM is testing extended memory..."
sleep 1
echo "done."
echo
sleep 0.125
echo "C:\>C:\DOS\MOUSE.EXE"
sleep 0.05
echo "C:\>C:\DOS\DOSKEY.EXE"
sleep 0.05
echo "C:\>C:\DOS\SMARTDRV.EXE /X"
sleep 0.05
echo "C:\>C:\COMMAND.COM"
sleep 0.0125
echo
echo
echo "Memework(R) LS-DOS(R) Version 6.9 build 420"
sleep 0.125
echo "             (C)Copyright Memework Corp 2017-2018"
echo

build_prompt () {
   echo -n "C:"
   echo -n "$PWD" | sed s:/:\\\\:g | tr a-z A-Z
   echo -n ">"
}
PROMPT='%{%f%b%k%}$(build_prompt)'
sleep 0.25

alias dir="ls -1 -l --color=none | tr a-z A-Z"

alias exit="unalias exit && reset && source ~/.zshrc"
