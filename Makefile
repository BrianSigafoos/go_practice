APP_NAME=go_practice
VERSION=0.0.1
REV=$(shell git rev-parse HEAD | cut -c1-6)
BUILD_DATE=$(shell date -u +%Y-%m-%dT%H:%M:%S%z)

.DEFAULT_GOAL := help

test: ## test
	go test -race -coverprofile coverage.txt ./...

compile: ## compile
	go build -ldflags "-X main.Version=${REV} -X main.BuildDate='${BUILD_DATE}'" -o "${APP_NAME}" main.go

build: test compile ## test and compile

prepare: ## go get + mod tidy
	go get
	go mod tidy

fmt: ## go fmt
	go fmt ./...

lint: ## lint
	golangci-lint run

fix: ## lint + autofix
	golangci-lint run --fix

help: ## list make commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-10s %s\n", $$1, $$2}'
