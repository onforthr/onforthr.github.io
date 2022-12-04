JEYKLL_IMAGE := jekyll/jekyll:4
DOCKER_CMD := docker run --rm -v="$(PWD):/srv/jekyll:Z"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

serve: ## Run Jekyll in server mode, watch for changes, rebuild the site
	$(DOCKER_CMD) -p 4000:4000 $(JEYKLL_IMAGE) jekyll server

update: ## Update Gemfile.lock
	$(DOCKER_CMD) -it $(JEYKLL_IMAGE) bundle update

.PHONY: help serve update
