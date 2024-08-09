{
  description = "ZMK firmware for Lily58";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    # zephyr-nix
    zephyr-nix.url = "github:adisbladis/zephyr-nix";
    zephyr-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, zephyr-nix, ... }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    zephyr = zephyr-nix.packages.x86_64-linux;
    in {
      # cf. https://nixos.wiki/wiki/flakes#Output_schema
      # `devShells.<system>.default` is used by `nix develop`
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = [
          (zephyr.sdk.override {
            targets = [
              "arm-zephyr-eabi"
            ];
          })
          zephyr.pythonEnv
          zephyr.hosttools
          pkgs.cmake
          pkgs.ninja
        ];
      };
    };
}
