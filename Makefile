.PHONY: help all clean copy build build-left build-right update-zmk
.DEFAULT_GOAL := help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: clean build copy

clean:
	rm -rvf $(CURDIR)/build
	mkdir -p $(CURDIR)/build

copy: | build
	cp -v $(CURDIR)/zmk/app/build/left/zephyr/zmk.uf2 $(CURDIR)/build/left.uf2
	cp -v $(CURDIR)/zmk/app/build/right/zephyr/zmk.uf2 $(CURDIR)/build/right.uf2

build: build-left build-right | clean ## build both sides of keyboard firmware

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

build-right:  ## (pristine) build firmware for right keyboard part
	cd zmk/app; \
	west \
		build \
		-p \
		-b nice_nano_v2 \
		-d build/right \
		-- \
		-DSHIELD=lily58_right \
		-DZMK_CONFIG=$(CURDIR)/lily58/config

update-zmk:  ## pull newest zmk code
	git subtree pull \
		--prefix zmk \
		https://github.com/zmkfirmware/zmk.git main \
		--squash
