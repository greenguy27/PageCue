#!/bin/bash
# Double-click on a Mac to run PageCue at http://localhost:8765 so the camera and mic work.
# Only this computer can reach it. Keep the Terminal window open; close it to stop.
cd "$(dirname "$0")" || exit 1
HERE="$(pwd)"
PORT=8765
URL="http://localhost:$PORT/"

if ! command -v python3 >/dev/null 2>&1 || ! python3 -c "" >/dev/null 2>&1; then
  echo "This launcher needs Python 3, which this Mac doesn't have yet."
  echo "Install it by running:  xcode-select --install"
  echo "then double-click this file again."
  read -r -p "Press Return to close."
  exit 1
fi

if lsof -nP -iTCP:$PORT -sTCP:LISTEN >/dev/null 2>&1; then
  # Something is already on the port. Only reuse it if it's serving this same copy of PageCue.
  if curl -s --max-time 3 "${URL}index.html" | cmp -s - "$HERE/index.html"; then
    echo "PageCue (this folder) is already running; opening it."
    open "$URL"
    exit 0
  fi
  echo ""
  echo "  Port $PORT is already in use by something else, probably another copy of PageCue"
  echo "  from a different folder. Close that Terminal window (or run the command below),"
  echo "  then double-click this launcher again:"
  echo ""
  echo "    kill \$(lsof -tiTCP:$PORT -sTCP:LISTEN)"
  echo ""
  read -r -p "Press Return to close."
  exit 1
fi

echo ""
echo "  PageCue is running at $URL"
echo "  Serving: $HERE"
echo "  Keep this window open while you use PageCue. Close it to stop."
echo ""
(sleep 1; open "$URL") &
# A tiny local web server for this folder only. "no-store" stops the browser from showing an old copy.
exec python3 - "$PORT" <<'PY'
import sys, http.server, functools, os
class H(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cache-Control", "no-store")
        super().end_headers()
    def log_message(self, *a): pass
port = int(sys.argv[1])
srv = http.server.ThreadingHTTPServer(("127.0.0.1", port), functools.partial(H, directory=os.getcwd()))
try: srv.serve_forever()
except KeyboardInterrupt: pass
PY
