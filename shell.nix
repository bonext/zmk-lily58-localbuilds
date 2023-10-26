{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    packages = with pkgs; [
      cmake
      dtc
      python311
      python311Packages.west
    ];

    PROJECT_ROOT = builtins.toString ./.;

    shellHook = ''
      source $PROJECT_ROOT/zephyr-sdk-0.15.0/environment-setup-x86_64-pokysdk-linux
    '';
  }
