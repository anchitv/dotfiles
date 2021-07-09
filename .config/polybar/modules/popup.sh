#!/bin/sh

BAR_HEIGHT=20  # polybar height
BORDER_SIZE=1  # border size from your wm settings
  
APPLICATION=$2
INPUT_WIDTH=$3
INPUT_HEIGHT=$4


if [ "$(xdotool getwindowfocus getwindowname)" = APPLICATION ]; then
    exit 0
fi

eval "$(xdotool getmouselocation --shell)"
eval "$(xdotool getdisplaygeometry --shell)"

# X
if [ "$((X + INPUT_WIDTH / 2 + BORDER_SIZE))" -gt "$WIDTH" ]; then #Right side
    : $((pos_x = WIDTH - INPUT_WIDTH - BORDER_SIZE))
elif [ "$((X - INPUT_WIDTH / 2 - BORDER_SIZE))" -lt 0 ]; then #Left side
    : $((pos_x = BORDER_SIZE))
else #Center
    : $((pos_x = X - INPUT_WIDTH / 2))
fi

# Y
if [ "$Y" -gt "$((HEIGHT / 2))" ]; then #Bottom
    : $((pos_y = HEIGHT - INPUT_HEIGHT - BAR_HEIGHT - BORDER_SIZE))
else #Top
    : $((pos_y = BAR_HEIGHT + BORDER_SIZE))
fi



yad --calendar --undecorated --fixed --close-on-unfocus --no-buttons \
    --width="$YAD_WIDTH" --height="$YAD_HEIGHT" --posx="$pos_x" --posy="$pos_y" \
    --title="yad-calendar" --borders=0 >/dev/null &


