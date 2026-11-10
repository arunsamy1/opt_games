#!/usr/bin/env bash
# Serve this folder over http://localhost and open the game.
# Ruffle needs a real HTTP origin: browsers block WebAssembly loaded from file://
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

PORT="${PORT:-8123}"
while ss -ltn 2>/dev/null | grep -q ":${PORT} " || (exec 3<>"/dev/tcp/127.0.0.1/${PORT}") 2>/dev/null; do
  PORT=$((PORT + 1))
done

python3 -m http.server "$PORT" --bind 127.0.0.1 >/dev/null 2>&1 &
SERVER=$!
trap 'kill "$SERVER" 2>/dev/null || true' EXIT INT TERM

sleep 1
URL="http://localhost:${PORT}/index.html"
echo "Dune Buggy running at ${URL}"
echo "Press Ctrl+C here when you're done playing."

if command -v xdg-open >/dev/null 2>&1; then
  xdg-open "$URL" >/dev/null 2>&1 || true
fi

wait "$SERVER"
