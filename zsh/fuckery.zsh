escapeInsert() {
  command=$1
  data=$2
  if [[ $ISTMUX ]]; then
    echo -e -n "\033Ptmux;\033\033\033]${command};${data}\007\033\\"
  else
    echo -e -n "\033]${command};${data}\a"
  fi
}

alias panic="dtrace -w -n \"BEGIN{ panic();}\""


colstress() {
beginDate=0
endDate=0
red=0
blue=0
green=0
beginDate=$(date +%s%3N)
while (( red++ < 256 )) { 
  beginDrawDate=$(date +%s%3N)
  while (( green++ < 256 )) { 
    while (( blue++ < 256 )) { 
      echo -e -n "\033[48;2;$[ $red-1 ];$[ $green-1 ];$[ $blue-1 ]m "
    }
    blue=0
  }
  green=0
  echo "Score:                                       $[ $(date +%s%3N)-$beginDate ] (Lower is better)"
  echo "Score within draw period:                    $[ $(date +%s%3N)-$beginDrawDate ]"
  echo "Estimated final score:                       $[ (($(date +%s%3N)-$beginDate)/$red)*256 ]"
  echo "Estimated final score given same conditions: $[ ($(date +%s%3N)-$beginDrawDate)*256 ]"
  echo "Current red value:                           $red/256"
  echo "Colors printed:                              $[ $red * 256 * 256 ]/16777216"
  echo
}
red=0
blue=0
green=0
endDate=$(date +%s%3N)
echo -e "\033[0m"
echo $beginDate
echo $endDate
echo "Score: $[ $endDate-$beginDate ] (Lower is better)"
beginDate=0
endDate=0
}


colstressnull() {
beginDate=0
endDate=0
red=0
blue=0
green=0
beginDate=$(date +%s%3N)
while (( red++ < 256 )) { 
  beginDrawDate=$(date +%s%3N)
  while (( green++ < 256 )) { 
    while (( blue++ < 256 )) { 
      echo -e -n "\033[48;2;$[ $red-1 ];$[ $green-1 ];$[ $blue-1 ]m " > /dev/null
    }
    blue=0
  }
  green=0
  echo "Score:                                       $[ $(date +%s%3N)-$beginDate ] (Lower is better)"
  echo "Score within draw period:                    $[ $(date +%s%3N)-$beginDrawDate ]"
  echo "Estimated final score:                       $[ (($(date +%s%3N)-$beginDate)/$red)*256 ]"
  echo "Estimated final score given same conditions: $[ ($(date +%s%3N)-$beginDrawDate)*256 ]"
  echo "Current red value:                           $red/256"
  echo "Colors printed:                              $[ $red * 256 * 256 ]/16777216"
  echo
}
red=0
blue=0
green=0
endDate=$(date +%s%3N)
echo -e "\033[0m"
echo $beginDate
echo $endDate
echo "Score: $[ $endDate-$beginDate ] (Lower is better)"
beginDate=0
endDate=0
}

traa() {
    echo ""
    echo  "\e[34m███████████████████████████████████"
    echo  "\e[34m███████████████████████████████████"
    echo  "\e[31m███████████████████████████████████"
    echo  "\e[31m███████████████████████████████████"
    echo  "\e[39m███████████████████████████████████"
    echo  "\e[39m███████████████████████████████████"
    echo  "\e[31m███████████████████████████████████"
    echo  "\e[31m███████████████████████████████████"
    echo  "\e[34m███████████████████████████████████"
    echo  "\e[34m███████████████████████████████████"
    echo  ""
}


alias dos="source $ADRYDDOTFILES/fuckery/dos/msdos.zsh"