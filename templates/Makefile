.DEFAULT_GOAL := help

help:  ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

setup:  ## Install dependencies
	@echo "TODO: wire up dependency install (e.g. uv sync / pip install -r requirements.txt)"

run:  ## Run the app locally
	python app/main.py

test:  ## Run tests
	@echo "TODO: wire up your test command"

.PHONY: help setup run test
