#!/usr/bin/env bash
set -euo pipefail

echo "Testing Dify API -> Ollama generation..."

docker exec -i docker-api-1 python - <<'PY'
import urllib.request
import json

payload = {
    "model": "qwen2.5:7b",
    "prompt": "Reply with only: OK",
    "stream": False
}

req = urllib.request.Request(
    "http://ollama:11434/api/generate",
    data=json.dumps(payload).encode(),
    headers={"Content-Type": "application/json"},
)

with urllib.request.urlopen(req, timeout=60) as r:
    print(r.status)
    print(r.read().decode())
PY