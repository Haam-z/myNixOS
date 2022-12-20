{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    rustup
    cmake
    cargo-binutils
    gcc
  ];
}
