# Dify Installation

## Purpose

Dify is used as the application layer for the local RAG foundation.

It provides:

- Web UI
- Knowledge base management
- Document chunking
- Retrieval testing
- Chat app interface
- Model provider configuration
- Integration with Ollama and Qdrant

## Installation Method

Dify is installed using the official Docker Compose deployment.

## Clone Dify

```bash
git clone https://github.com/langgenius/dify.git
cd dify/docker
```

## Prepare Environment
```bash
cp .env.example .env
```

### Required Changes

``` bash
VECTOR_STORE=qdrant
QDRANT_URL=http://qdrant:6333
VECTOR_INDEX_NAME_PREFIX=Vector_index
```

## Start Dify
```bash
docker compose --profile qdrant --profile postgresql --profile collaboration up -d
```

### Verify Containers

```bash
docker ps
```
### Expected core containers:

```text
docker-api-1
docker-worker-1
docker-web-1
docker-db_postgres-1
docker-redis-1
docker-qdrant-1
docker-nginx-1
docker-plugin_daemon-1
docker-sandbox-1
docker-ssrf_proxy-1
```
## Access Dify

Dify web UI is exposed through nginx:

```text
http://<server-ip>
https://<server-ip>
```
## Ollama Base URL in Dify

Use:
```text
http://ollama:11434
```
