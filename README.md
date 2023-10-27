# Self-Contained ZMK Firmware Builds

Under construction.

Slapped together on top of nix shell via zmk firmware/zephyr official docs.

zmk pulled in as a git subtree from https://github.com/zmkfirmware/zmk

zephyr sdk installed via [official docs](https://docs.zephyrproject.org/3.2.0/develop/getting_started/index.html#install-zephyr-sdk) (sans udev rules).

    wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.15.0/zephyr-sdk-0.15.0_linux-x86_64.tar.gz
    wget -O - https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.15.0/sha256.sum | shasum --check --ignore-missing

## lily58

![layout](./lily58/lily58.png)
