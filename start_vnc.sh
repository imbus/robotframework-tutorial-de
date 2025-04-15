#!/bin/bash

# Logs
LOG_DIR="$HOME/vnc_logs"
mkdir -p "$LOG_DIR"
VNC_LOG="$LOG_DIR/vnc.log"
NOVNC_LOG="$LOG_DIR/novnc.log"

# Funktionen zum Beenden
cleanup() {
    echo "Beende Prozesse..."

    # VNC Server beenden
    vncserver -kill :1

    # noVNC Prozess beenden
    if [ -n "$NOVNC_PID" ]; then
        kill "$NOVNC_PID"
    fi

    echo "Alle Prozesse gestoppt."
    exit 0
}

# Bei STRG+C oder Script-Ende aufräumen
trap cleanup SIGINT SIGTERM

echo "Starte TigerVNC Server..."
tigervncserver :1 -geometry 1440x768 -depth 16 -rfbport 5901 -dpi 96 -localhost -desktop fluxbox -fg > "$VNC_LOG" 2>&1 &
VNC_PID=$!

echo "Starte noVNC..."
/usr/local/novnc/noVNC*/utils/launch.sh --listen 6080 --vnc localhost:5901 > "$NOVNC_LOG" 2>&1 &
NOVNC_PID=$!

echo "TigerVNC läuft (PID:$VNC_PID, Port:5901), noVNC läuft (PID:$NOVNC_PID, Port:6080)"
echo "Logs: $VNC_LOG, $NOVNC_LOG"

# Warten, bis einer der Prozesse endet
wait $VNC_PID
cleanup
