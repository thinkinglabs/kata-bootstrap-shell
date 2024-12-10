.DEFAULT_GOAL := help
.PHONY: help test

help: ## Print the help documentation
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

lint: ## Lint
	shellcheck ./bin/*

test: lint ## Executes tests
	shellspec
