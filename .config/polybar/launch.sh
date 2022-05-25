killall -q polybar

PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

if [ ! -z "${PRIMARY}" ]; then
  MONITOR=$PRIMARY TRAY_POS=right polybar  --reload mybar &

  for m in $OTHERS; do
    MONITOR=$m polybar --reload mybar &
  done
else
  for m in $OTHERS; do
    MONITOR=$m TRAY_POS=right polybar --reload mybar &
  done
fi
