
# Terminate already running bar instances
killall -q polybar

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar main >>/tmp/polybar1.log 2>&1 &
polybar laptop  >>/tmp/polybar2.log 2>&1 &

echo "Bars launched..."
