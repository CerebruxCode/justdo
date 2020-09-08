#!/bin/bash
#  Usage tomato ["task name"] [mins] [click_interval]

task=${1:-"Starting pomodoro task"}
mins=${2:-25}
interval=${3:-10};

TICKS="no"
APP_NAME="Pomodoro"
SOUND_FILE="/usr/share/sounds/Oxygen-Im-Phone-Ring.ogg"
SOUND_CLICK_FILE="/usr/share/sounds/Oxygen-Im-Message-In.ogg"
PLAYER='paplay'
BAR_WIDTH=40;

#  Pomodoro time start: notify user
secs=$(( mins * 60 ))
loops=$((secs / interval))
notify-send "${APP_NAME}" "Start: ${task}"

# Progress bar loop
SECONDS=0
for ((i=0; i<loops; i++)) 
do 
    duration=$SECONDS;
    percentage="$(( 100 - 100*(secs - duration) / secs ))";

    bar1_w=$(( percentage * BAR_WIDTH / 100 ));
    bar2_w=$(( BAR_WIDTH - bar1_w ));
    bar1_s=$(printf "%${bar1_w}s" | tr " " "#")
    bar2_s=$(printf "%${bar2_w}s" | tr " " ".")
    progress="${bar1_s}${bar2_s}"

    time_left_str="$(( (secs - duration) / 60 )):$(( (secs - duration) % 60 ))";
    percentage_str="${percentage}%"
    printf "\r%s Time left %s (%s) " "${task}: $progress" "$time_left_str" "$percentage_str"
    
    # Did time pass?
    if (( duration > secs )); then
        break;
    fi
    sleep "$interval";

    [ "${TICKS}" == "yes" ] && ${PLAYER} "${SOUND_CLICK_FILE}" 2> /dev/null
done

printf "\r\033[K%s: Done! \n" "${task}"

#  Time end: play sound and notify
${PLAYER} "${SOUND_FILE}" 2> /dev/null
notify-send "${APP_NAME}" "End: ${task}"
