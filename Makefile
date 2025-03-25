IMAGE_NAME=escape


docker-build: ## Build the docker image
	@docker build --build-arg OPENAI_API_KEY=$(OPENAI_API_KEY) -t $(IMAGE_NAME) .

docker-run: ## Run the app inside the docker image
	@docker run --rm -it -e OPENAI_API_KEY=$(OPENAI_API_KEY) $(IMAGE_NAME):latest

run: ## Convenience for docker-run
	@MAKE docker-run

help: ## Displays this information.
	@printf '%s\n' "Usage: make <command>"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@printf '\n'




