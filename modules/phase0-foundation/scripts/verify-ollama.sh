#!/usr/bin/env bash
set -euo pipefail

echo "Testing Ollama model list..."
curl -s http://localhost:11434/api/tags | jq '.models[].name'

echo "Testing qwen2.5:7b generation..."
curl -s http://localhost:11434/api/generate \
  -d '{
    "model": "qwen2.5:7b",
    "prompt": "Reply with only: OK",
    "stream": false
  }' | jq -r '.response'

echo "Testing bge-m3 embedding..."
curl -s http://localhost:11434/api/embeddings \
  -d '{
    "model": "bge-m3",
    "prompt": "This is a test document."
  }' | jq '.embedding | length'