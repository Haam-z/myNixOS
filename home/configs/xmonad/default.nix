{ config, lib, pkgs, ... }:

{
  home.file.nixos_compil = {
    source = ./scripts/nix-compil.sh;
    target = "/home/haam/.xmonad/scripts/nixos-compil.sh";
  };
  home.file.xmoand = {
    source = ./xmonad.hs;
    target = "/home/haam/.xmonad/xmonad.hs";
  };
}
