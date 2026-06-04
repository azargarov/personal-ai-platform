#!/usr/bin/env bash
set -euo pipefail

DIFY_NETWORK="${DIFY_NETWORK:-docker_default}"
OLLAMA_CONTAINER="${OLLAMA_CONTAINER:-ollama}"

echo "Connecting Ollama container '$OLLAMA_CONTAINER' to network '$DIFY_NETWORK'..."

if docker network inspect "$DIFY_NETWORK" >/dev/null 2>&1; then
  docker network connect --alias ollama "$DIFY_NETWORK" "$OLLAMA_CONTAINER" 2>/dev/null || true
else
  echo "Docker network not found: $DIFY_NETWORK"
  exit 1
fi

echo "Done."