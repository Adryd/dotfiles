######## BIG BIG BIG BIG BIG NOTE
# THE CODE HERE IS A FUCKING MESS
# IT IS MADE TO WORK WITH TWO SCHEMES WHICH ARE **HARDCODED**
# FEEL FREE TO CHANGE AS YOU WISH BUT IT WILL BE A HUGE PAIN




ADRYDDOTFILES="$HOME/.ashell"
source "$ADRYDDOTFILES/theme_settings_default.zsh"
source "$ADRYDDOTFILES/theme_settings.zsh"



if [[ $PROMPTTYPE == "powerline" ]]; then
    LEFT_DEVIDER=""
    LEFT_DEVIDER_LITE=""
    RIGHT_DEVIDER=""
    RIGHT_DEVIDER_lite=""
    
    BATTERY="🔋"
    CHARGING="🔌︎"
    
    UPTIME="↑"
    
    LOCK=""
    elif [[ $PROMPTTYPE != "powerline" ]]; then
    source "$ADRYDDOTFILES/.tmux/vars_basic.zsh"
fi




prefix_pressed_text="PREFIX"
insert_mode_text="INSERT"
copy_mode_text="COPY"
normal_mode_text="NORMAL"

prefix_mode_fg="colour226"
normal_mode_fg="colour16"
copy_mode_fg="colour82"
bg="colour33"

prefix_segment() {
    prefix_indicator="#{?client_prefix,${prefix_pressed_text},${normal_mode_text}}"
    normal_or_copy_indicator="#[bg=${bg}]#{?pane_in_mode,#[fg=${copy_mode_fg}]${copy_mode_text},#[fg=${normal_mode_fg}]${insert_mode_text}}";
    echo $prefix_indicator "#[fg=${normal_mode_fg}]${separator}" $normal_or_copy_indicator
}

prefix() {
    echo "#{?client_prefix,PREFIX,NORMAL}"
}

noc_test() {
    echo "#{?pane_in_mode,COPY,INSERT}"
}


prompt_segment_right() {
    if [[ $PROMPTTYPE == "powerline" ]]; then
        local bg fg
        [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
        [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
        if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
            SEGMENT="\x20$SEGMENT#[bg=$CURRENT_BG,fg=$1]$RIGHT_DEVIDER#[bg=$1,fg=$2]\x20"
            elif [[ $1 == $CURRENT_BG ]]; then
            SEGMENT="$SEGMENT#[fg=$2]$RIGHT_DEVIDER_lite#[bg=$1,fg=$2]\x20"
        else
            SEGMENT="$SEGMENT#[fg=$1]$RIGHT_DEVIDER#[bg=$1,fg=$2]\x20"
        fi
        CURRENT_BG=$1
        [[ -n $3 ]] && SEGMENT="$SEGMENT$3\x20"
    else
        SEGMENT="$SEGMENT#[fg=colour15]$RIGHT_DEVIDER\x20"
        [[ -n $3 ]] && SEGMENT="$SEGMENT$3\x20"
    fi
}

prompt_segment_left() {
    
    if [[ $PROMPTTYPE == "powerline" ]]; then
        local bg fg
        [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
        [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
        if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
            SEGMENT="$SEGMENT#[bg=$1,fg=$CURRENT_BG]$LEFT_DEVIDER#[bg=$1,fg=$2]\x20"
            elif [[ $1 == $CURRENT_BG ]]; then
            SEGMENT="$SEGMENT#[fg=$2]$LEFT_DEVIDER_LITE#[bg=$1,fg=$2]\x20"
        else
            SEGMENT="#[bg=$1,fg=$2] "
        fi
        
        CURRENT_BG=$1
        [[ -n $3 ]] && SEGMENT="$SEGMENT$3\x20"
        
    else
        if [[ $SEGMENT == "" ]]; then
            SEGMENT="#[fg=colour15]-"
        fi
        SEGMENT="$SEGMENT#[fg=colour15]-\x20"
        [[ -n $3 ]] && SEGMENT="$SEGMENT$3\x20"
    fi
}

prompt_left_end() {
    if [[ $PROMPTTYPE == "powerline" ]]; then
        if [[ $CURRENT_BG != 'NONE' ]]; then
            SEGMENT="$SEGMENT#[bg=$DEFAULT_BG,fg=$CURRENT_BG]$LEFT_DEVIDER"
        fi
    fi
}
if [[ $1 == "status-right" ]]; then
    SEGMENT=""
    CURRENT_BG="NONE"
    if [[ $PROMPTTYPE == "powerline" ]]; then
        prompt_segment_right colour236 colour255 "$UPTIME $(uptime | awk '$3 == $3 {print $3}' | sed 's/,//')"
        prompt_segment_right colour236 colour255 "$(if [[ $(pmset -g batt | grep -o -E 'discharging') == 'discharging' ]]; then printf $BATTERY; else printf $CHARGING; fi) $(pmset -g batt | grep -o -E '([0-9])?([0-9])?[0-9]%')"
        prompt_segment_right colour239 colour255 "$(date +%d-%m-%Y)"
        prompt_segment_right colour239 colour255 "$(date +'%I:%M %p')"
        prompt_segment_right colour255 colour1 "#[bold]${LOCK} $(hostname)"
    else
        SEGMENT="#[bold,fg=colour9]${USER}#[nobold,fg=colour15]@#[bold,fg=colour12]$(hostname)"
    fi
    echo "${SEGMENT}"
    elif [[ $1 == "status-left" ]]; then
    SEGMENT=""
    CURRENT_BG="NONE"
    if [[ $PROMPTTYPE == "powerline" ]]; then
        if [[ $COLORS == "Shells" ]]; then
            prompt_segment_left colour2 colour0 "#[bold]$(prefix)"
        else
            prompt_segment_left colour9 colour15 "#[bold]$(prefix)"
        fi
        prompt_segment_left colour1 colour15 "#[bold]$(noc_test)"
        prompt_left_end
    else
        SEGMENT=" #[bold,fg=colour255]-- $(prefix) - $(noc_test) --"
    fi
    echo $SEGMENT
    elif [[ $1 == "window-status-format" ]]; then
    SEGMENT=""
    CURRENT_BG="NONE"
    prompt_segment_left colour239 colour5 "$UPTIME $(uptime | awk '$3 == $3 {print $3}' | sed 's/,//')"
    prompt_segment_left colour239 colour5 "$UPTIME $(uptime | awk '$3 == $3 {print $3}' | sed 's/,//')"
    
    prompt_left_end
    echo $SEGMENT
    elif [[ $1 == "window-status-current-format" ]]; then
    SEGMENT=""
    CURRENT_BG="NONE"
    prompt_segment_left colour16 background "b"
    prompt_segment_left colour4 colour15 "$UPTIME $(uptime | awk '$3 == $3 {print $3}' | sed 's/,//')"
    prompt_segment_left colour4 colour7 "$UPTIME $(uptime | awk '$3 == $3 {print $3}' | sed 's/,//')"
    
    prompt_left_end
    echo $SEGMENT
fi







