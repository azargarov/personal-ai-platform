.PHONY: models verify-ollama verify-qdrant verify-worker verify-all

models:
	./scripts/pull-models.sh

verify-ollama:
	./scripts/verify-ollama.sh

verify-qdrant:
	./scripts/verify-dify-qdrant.sh

verify-worker:
	./scripts/verify-worker-ollama.sh

verify-all: verify-ollama verify-qdrant verify-worker