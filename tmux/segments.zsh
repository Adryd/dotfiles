
BATTERY="🔋"
CHARGING="🔌︎"
UPTIME="↑"
LOCK=""

prefix() {
  echo "#{?client_prefix,PREFIX,NORMAL}"
}

noc_test() {
  echo "#{?pane_in_mode,COPY,INSERT}"
}

if [[ $1 == "prefix" ]]; then
    echo $(prefix)
elif [[ $1 == "noc_test" ]]; then
    echo $(noc_test)
elif [[ $1 == "uptime" ]]; then
    echo "$UPTIME $(uptime | awk '$3 == $3 {print $3}' | sed 's/,//') days"
elif [[ $1 == "battery" ]]; then
    if [[ $(pmset -g batt | grep -o -E 'discharging') == 'discharging' ]]; then 
        printf $BATTERY; 
    else 
        printf $CHARGING;
    fi
    echo $(pmset -g batt | grep -o -E '([0-9])?([0-9])?[0-9]%')
elif [[ $1 == "date" ]]; then
    echo $(date +%d-%m-%Y)
elif [[ $1 == "time" ]]; then
    echo "$(date +'%I:%M %p')"
elif [[ $1 == "hostname" ]]; then
    echo $(hostname)
else
    echo asd
fi
