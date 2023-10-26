let
  pkgs = import <nixpkgs> { config = {}; overlays = []; };
in
  pkgs.mkShell {
    packages = with pkgs; [
      cmake
      dtc
      python311
      python311Packages.west
      python311Packages.pyelftools
      python311Packages.pyyaml
      python311Packages.pykwalify
      python311Packages.canopen
      python311Packages.packaging
      python311Packages.progress
      python311Packages.psutil
      python311Packages.pylink-square
      python311Packages.anytree
      python311Packages.intelhex
      python311Packages.colorama
      python311Packages.ply
      python311Packages.gcovr
      python311Packages.coverage
      python311Packages.pytest
      python311Packages.mypy
      python311Packages.mock
      python311Packages.python-magic
      python311Packages.junitparser
      python311Packages.pylint
      python311Packages.breathe
      python311Packages.sphinx
      python311Packages.sphinx_rtd_theme
      python311Packages.sphinx-tabs
      python311Packages.pygments
      python311Packages.sphinx-notfound-page
      python311Packages.anytree
      python311Packages.pillow
      python311Packages.grpcio-tools
      python311Packages.PyGithub
      python311Packages.graphviz
      python311Packages.sphinx-copybutton
      python311Packages.pyserial
      python311Packages.pyocd
      python311Packages.tabulate
      python311Packages.cbor
      python311Packages.psutil
    ];

    PROJECT_ROOT = builtins.toString ./.;

    shellHook = ''
      source $PROJECT_ROOT/zephyr-sdk-0.15.0/environment-setup-x86_64-pokysdk-linux
    '';
  }
