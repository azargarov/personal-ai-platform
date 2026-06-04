#!/usr/bin/env bash
set -euo pipefail

echo "Testing Dify worker -> Ollama embedding..."
docker exec -i docker-worker-1 python - <<'PY'
import urllib.request
import json

payload = {
    "model": "bge-m3",
    "prompt": "Worker embedding test."
}

req = urllib.request.Request(
    "http://ollama:11434/api/embeddings",
    data=json.dumps(payload).encode(),
    headers={"Content-Type": "application/json"},
)

with urllib.request.urlopen(req, timeout=60) as r:
    print(r.status)
    data = json.loads(r.read().decode())
    print("embedding length:", len(data["embedding"]))
PY