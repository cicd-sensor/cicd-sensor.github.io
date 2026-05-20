# Versions are sourced from Cargo.toml so Dependabot can bump them in one place.
MDBOOK_VERSION  := $(shell sed -nE 's/^mdbook = "=?([0-9.]+)"/\1/p' Cargo.toml)
MERMAID_VERSION := $(shell sed -nE 's/^mdbook-mermaid = "=?([0-9.]+)"/\1/p' Cargo.toml)

.PHONY: install serve build

install: ## Install pinned mdbook tools via cargo
	cargo install --locked --version $(MDBOOK_VERSION) mdbook
	cargo install --locked --version $(MERMAID_VERSION) mdbook-mermaid

serve: ## Live-preview the cicd-sensor docs locally
	./serve.sh

build: ## Build the rendered book into ./book
	MDBOOK_BOOK__SRC=$${SRC:-../cicd-sensor/docs} mdbook build
