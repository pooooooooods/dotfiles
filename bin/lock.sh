#!/usr/bin/env bash

# Based on time of the day, decide if system should suspend or hibernate
# Sleep if time of day is less than 6 PM, else hibernate.
if [ $(date +%H) -gt 18 ]
then
   export sleepOrHibernate="hibernate"
else
   export sleepOrHibernate="suspend"
fi

export primaryDisplay="$(xrandr | grep ' connected' | cut -d ' ' -f 1)"

xidlehook \
    `# Don't lock when there's audio playing` \
    --not-when-audio \
    `# Dim screen [10 min]` \
    --timer 600 \
        'xrandr --output "${primaryDisplay}" --brightness .1' \
        'xrandr --output "${primaryDisplay}" --brightness 1' \
    `# Set brightness back to normal and turn off screen [15 min]` \
    --timer 300 \
        'xrandr --output "${primaryDisplay}" --brightness 1; xset dpms force standby' \
        '' \
    `# Suspend or Hibernate based on time of the day [20 min]` \
    --timer 300 \
        'systemctl ${sleepOrHibernate}' \
        '' \
    --socket "/tmp/xidlehook.sock"
