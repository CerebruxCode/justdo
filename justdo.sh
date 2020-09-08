#!/bin/bash -x
# shellcheck source=/dev/null
#  Usage justdo "task name" duration(mins) interval(seconds)

ASSETS="/home/$USER/.justdo"
source "${ASSETS}/justdo.conf"

# Pomodoro time start: notify user
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
    bar1_s=$(printf "%${bar1_w}s" | tr " " "|")
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
notify-send "${APP_NAME}" "End: ${task}"
${PLAYER} "${SOUND_FILE}" 2> /dev/null

