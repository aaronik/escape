IMAGE_NAME=escape


build: ## Build the docker image
	@docker build --build-arg OPENAI_API_KEY=$(OPENAI_API_KEY) --build-arg USER_NAME=$(USER) -t $(IMAGE_NAME) .

run: ## Run the built image
	@docker run --rm -it -e OPENAI_API_KEY=$(OPENAI_API_KEY) -e USER_NAME=$(USER) $(IMAGE_NAME):latest

br: ## Convenience for build and then run
	@MAKE build
	@MAKE run

help: ## Displays this information.
	@printf '%s\n' "Usage: make <command>"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@printf '\n'
