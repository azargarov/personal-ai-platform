#!/usr/bin/env bash
set -euo pipefail

echo "Testing Dify API -> Qdrant..."
docker exec -i docker-api-1 python - <<'PY'
import urllib.request

url = "http://qdrant:6333/collections"
with urllib.request.urlopen(url, timeout=10) as r:
    print(r.status)
    print(r.read().decode())
PY