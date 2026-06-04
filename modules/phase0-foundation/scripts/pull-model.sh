#!/usr/bin/env bash
set -euo pipefail

docker exec ollama ollama pull qwen2.5:7b
docker exec ollama ollama pull bge-m3
docker exec ollama ollama pull nomic-embed-text
docker exec ollama ollama pull qwen2.5-coder:7b
docker exec ollama ollama pull qllama/bge-reranker-v2-m3