# Variables

LEFT_DEVIDER=""
LEFT_DEVIDER_LITE=""
RIGHT_DEVIDER=""
RIGHT_DEVIDER_LITE=""

    prefix() {
        echo "#{?client_prefix,PREFIX,NORMAL}"
    }

    noc_test() {
        echo "#{?pane_in_mode,COPY,INSERT}"
    }

CURRENT_BG="NONE"
DEFAULT_BG="colour234"
SEGMENT=""

prompt_segment() {
    if [[ $1 == "l" ]]; then # LEFT SEGMENT
        local bg fg
        
        if [[ $2 == "end" ]]; then # IF PROMPT SEGMENT ENDS
            if [[ $CURRENT_BG != 'NONE' ]]; then
                SEGMENT="$SEGMENT#[bg=$DEFAULT_BG,fg=$CURRENT_BG]$LEFT_DEVIDER"
            fi
        else
            
            # PROMPT SEGMENT GENERATOR
            
            [[ -n $2 ]] && bg="%K{$2}" || bg="%k"
            [[ -n $3 ]] && fg="%F{$3}" || fg="%f"
            
            if [[ $CURRENT_BG != 'NONE' && $2 != $CURRENT_BG ]]; then
                SEGMENT="$SEGMENT#[bg=$2,fg=$CURRENT_BG]$LEFT_DEVIDER#[bg=$2,fg=$3]\x20" # IF HAS PREVIOUS SEGMENT
            elif [[ $2 == $CURRENT_BG ]]; then
                SEGMENT="$SEGMENT#[fg=$3]$LEFT_DEVIDER_LITE#[bg=$2,fg=$3]\x20" # IF PREVIOUS SEGMENT IS SAME COLOR
            else
                SEGMENT="$SEGMENT#[bg=$2,fg=$3] " # IF NO PREVIOUS COLOR OR OTHER SITUATUION
            fi
            
            CURRENT_BG=$2
            [[ -n $4 ]] && SEGMENT="$SEGMENT$4\x20"
        fi
    elif [[ $1 == "r" ]]; then
        local bg fg
        [[ -n $2 ]] && bg="%K{$2}" || bg="%k"
        [[ -n $3 ]] && fg="%F{$3}" || fg="%f"
        
        if [[ $CURRENT_BG != 'NONE' && $2 != $CURRENT_BG ]]; then
            SEGMENT="\x20$SEGMENT#[bg=$CURRENT_BG,fg=$2]$RIGHT_DEVIDER#[bg=$2,fg=$3]\x20" # IF HAS PREVIOUS SEGMENT
        elif [[ $2 == $CURRENT_BG ]]; then
            SEGMENT="$SEGMENT#[fg=$3]$RIGHT_DEVIDER_LITE#[bg=$2,fg=$3]\x20" # IF PREVIOUS SEGMENT IS SAME COLOR
        else
            SEGMENT="$SEGMENT#[fg=$2]$RIGHT_DEVIDER#[bg=$2,fg=$3]\x20" # IF NO PREVIOUS COLOR OR OTHER SITUATUION
        fi
        #echo $CURRENT_BG
        CURRENT_BG=$2
        [[ -n $4 ]] && SEGMENT="$SEGMENT$4\x20"
    fi
}

status_right() {
    prompt_segment r colour236 colour255 "$($ADRYDDOTFILES/tmux/segments.zsh uptime)"
    prompt_segment r colour236 colour255 "$($ADRYDDOTFILES/tmux/segments.zsh battery)"
    prompt_segment r colour239 colour255 "$($ADRYDDOTFILES/tmux/segments.zsh date)"
    prompt_segment r colour239 colour255 "$($ADRYDDOTFILES/tmux/segments.zsh time)"
    prompt_segment r colour255 colour1 "#[bold]$($ADRYDDOTFILES/tmux/segments.zsh hostname)"
}
status_left() {
    prompt_segment l colour2 colour0 "#[bold]$($ADRYDDOTFILES/tmux/segments.zsh prefix)"
    prompt_segment l colour1 colour15 "#[bold]$($ADRYDDOTFILES/tmux/segments.zsh noc_test)"
    prompt_segment l end
}
#window_status_format() {}
#window_current_format() {}






if [[ $1 == "status-right" ]]; then
    status_right
    elif [[ $1 == "status-left" ]]; then
    status_left
    elif [[ $1 == "window-status-format" ]]; then
    window_status_format
    elif [[ $1 == "window-current-format" ]]; then
    window_current_format
    elif [[ $1 == "get-color" ]]; then
    echo $DEFAULT_BG
fi

echo $SEGMENT