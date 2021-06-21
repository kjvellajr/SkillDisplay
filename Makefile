SHELL := /bin/bash

.PHONY = help
.DEFAULT_GOAL := help

install: ## install packages
	npm install

build: install ## build site
	npm run build
	cp -r build/* docs/

help: 
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
