NAME := $(shell awk '/^name:/{print $$2}' daml.yaml)
VERSION := $(shell awk '/^version:/{print $$2}' daml.yaml)
SDK_VERSION := $(shell awk '/^sdk-version:/{print $$2}' daml.yaml)
DAR := .daml/dist/$(NAME)-$(VERSION).dar
DAR_DIR := dist
# Distinct artifact for the SDK 3.5.2 / LF 2.1 build (keeps older DARs in dist/)
DAR_OUT := $(DAR_DIR)/test-daml-hello-$(SDK_VERSION)-lf2.1-$(VERSION).dar

.PHONY: build
build:
	dpm build
	mkdir -p $(DAR_DIR)
	cp $(DAR) $(DAR_OUT)
