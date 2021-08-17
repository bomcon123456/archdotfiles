#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m   polybar background -c /home/termanteus/Downloads/apps/etc/another_dotfiles/polybar/config &
    MONITOR=$m   polybar left -c /home/termanteus/Downloads/apps/etc/another_dotfiles/polybar/config &
    MONITOR=$m   polybar shortcuts -c /home/termanteus/Downloads/apps/etc/another_dotfiles/polybar/config &
    # MONITOR=$m   polybar media -c /home/termanteus/Downloads/apps/etc/another_dotfiles/polybar/config &
    MONITOR=$m   polybar mediacontrols -c /home/termanteus/Downloads/apps/etc/another_dotfiles/polybar/config &
    MONITOR=$m   polybar datetime -c /home/termanteus/Downloads/apps/etc/another_dotfiles/polybar/config &
    MONITOR=$m   polybar volume -c /home/termanteus/Downloads/apps/etc/another_dotfiles/polybar/config &
    MONITOR=$m   polybar battnet -c /home/termanteus/Downloads/apps/etc/another_dotfiles/polybar/config &
    MONITOR=$m   polybar netspeed -c /home/termanteus/Downloads/apps/etc/another_dotfiles/polybar/config &
  done
fi
MONITOR=HDMI-1-0   polybar media -c /home/termanteus/Downloads/apps/etc/another_dotfiles/polybar/config &
MONITOR=eDP1   polybar media_nocava -c /home/termanteus/Downloads/apps/etc/another_dotfiles/polybar/config &

MONITOR=HDMI-1-0   polybar netstuff -c /home/termanteus/Downloads/apps/etc/another_dotfiles/polybar/config &

echo "Polybar launched..."
