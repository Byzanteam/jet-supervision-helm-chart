.DEFAULT_GOAL := help

RELEASE ?= gxzh

.PHONY: help install upgrade uninstall dryrun

help: echo-release ## List commands
	@awk 'BEGIN {FS = ":.*##"; printf ""} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

install: echo-release ## Install the release
	@helm install -f values.local.yaml $(RELEASE) ./

upgrade: echo-release ## Upgrade the relase
	@helm upgrade -f values.local.yaml $(RELEASE) ./

uninstall: echo-release ## Uninstall current release
	@helm uninstall $(RELEASE)

dryrun: echo-release
	@helm install -f values.local.yaml --dry-run $(RELEASE) ./

echo-release:
	# ReleaseName: `$(RELEASE)`
	# ----------------------

