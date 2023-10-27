.PHONY: help
.DEFAULT_GOAL := help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build-left:  ## (pristine) build firmware for left keyboard part
	cd zmk/app; \
	west \
		build \
		-p \
		-b nice_nano_v2 \
		-d build/left \
		-- \
		-DSHIELD=lily58_left \
		-DZMK_CONFIG=$(CURDIR)/lily58/config
