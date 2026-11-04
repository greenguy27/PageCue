#!/bin/bash
# Double-click on a Mac to run PageCue at http://localhost:8765 so the camera and mic work.
# Only this computer can reach it. Keep the Terminal window open; close it to stop.
cd "$(dirname "$0")" || exit 1
PORT=8765
URL="http://localhost:$PORT/"

if lsof -nP -iTCP:$PORT -sTCP:LISTEN >/dev/null 2>&1; then
  echo "PageCue is already running; opening it."
  open "$URL"
  exit 0
fi

if command -v python3 >/dev/null 2>&1 && python3 -c "" >/dev/null 2>&1; then
  echo ""
  echo "  PageCue is running at $URL"
  echo "  Keep this window open while you use PageCue. Close it to stop."
  echo ""
  (sleep 1; open "$URL") &
  exec python3 -m http.server "$PORT" --bind 127.0.0.1
else
  echo "This launcher needs Python 3, which this Mac doesn't have yet."
  echo "Install it by running:  xcode-select --install"
  echo "then double-click this file again."
  read -r -p "Press Return to close."
fi
