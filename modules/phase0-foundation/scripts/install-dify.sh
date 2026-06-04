#!/usr/bin/env bash
set -euo pipefail

DIFY_DIR="${DIFY_DIR:-$HOME/dify}"

if [ -d "$DIFY_DIR" ]; then
  echo "Dify directory already exists: $DIFY_DIR"
else
  echo "Cloning Dify into $DIFY_DIR..."
  git clone https://github.com/langgenius/dify.git "$DIFY_DIR"
fi

cd "$DIFY_DIR/docker"

if [ ! -f ".env" ]; then
  cp .env.example .env
  echo "Created .env from .env.example"
else
  echo ".env already exists"
fi

echo "Setting Qdrant configuration..."
sed -i.bak 's|^VECTOR_STORE=.*|VECTOR_STORE=qdrant|' .env || true

if grep -q '^QDRANT_URL=' .env; then
  sed -i 's|^QDRANT_URL=.*|QDRANT_URL=http://qdrant:6333|' .env
else
  echo 'QDRANT_URL=http://qdrant:6333' >> .env
fi

if grep -q '^VECTOR_INDEX_NAME_PREFIX=' .env; then
  sed -i 's|^VECTOR_INDEX_NAME_PREFIX=.*|VECTOR_INDEX_NAME_PREFIX=Vector_index|' .env
else
  echo 'VECTOR_INDEX_NAME_PREFIX=Vector_index' >> .env
fi

echo "Starting Dify..."
docker compose --profile qdrant --profile postgresql --profile collaboration up -d

echo "Dify installation started."
echo "Check status with: docker ps"