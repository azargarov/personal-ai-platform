# Local AI Platform — Phase 0 Foundation

## Purpose

This setup provides a local RAG foundation based on Dify, Ollama and Qdrant.

## Components

- Dify — application layer and RAG UI
- Ollama — local LLM and embedding runtime
- Qdrant — vector database
- PostgreSQL — Dify metadata database
- Redis — Dify queue/cache
- Nginx — Dify frontend reverse proxy

## Models

- qwen2.5:7b — chat model
- bge-m3:latest — embedding model
- qllama/bge-reranker-v2-m3 — installed, but not used in Phase 0

## Phase 0 Acceptance Criteria

- Ollama responds from host
- Dify API can reach Ollama
- Dify worker can reach Ollama
- bge-m3 embedding works
- Qdrant is reachable from Dify
- Dify creates Qdrant collection
- Retrieval test returns the expected chunk
- Chat app answers from knowledge base with citation