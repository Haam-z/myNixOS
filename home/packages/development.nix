{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    bun
    cargo
    cmake
    deno
    nodejs
    python
  ];
}
