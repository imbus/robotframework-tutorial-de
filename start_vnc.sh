#!/bin/bash

# Logs
LOG_DIR="$HOME/vnc_logs"
mkdir -p "$LOG_DIR"
VNC_LOG="$LOG_DIR/vnc.log"
NOVNC_LOG="$LOG_DIR/novnc.log"

cleanup() {
    echo "Beende Prozesse..."

    vncserver -kill :1

    if [ -n "$NOVNC_PID" ]; then
        kill "$NOVNC_PID"
    fi

    echo "Alle Prozesse gestoppt."
    exit 0
}

trap cleanup SIGINT SIGTERM

echo "Starte TigerVNC Server..."
tigervncserver :1 -geometry 1440x768 -depth 16 -rfbport 5901 -dpi 96 -localhost -desktop fluxbox -SecurityTypes None > "$VNC_LOG" 2>&1


echo "Starte noVNC..."
/usr/local/novnc/noVNC*/utils/launch.sh --listen 6080 --vnc localhost:5901 > "$NOVNC_LOG" 2>&1 &
NOVNC_PID=$!

echo "TigerVNC läuft (Port:5901), noVNC läuft (PID:$NOVNC_PID, Port:6080)"
echo "Logs: $VNC_LOG, $NOVNC_LOG"

wait $NOVNC_PID
cleanup
