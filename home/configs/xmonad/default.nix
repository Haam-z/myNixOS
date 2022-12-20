{ config, lib, pkgs, ... }:

{
  home.file.xmoand = {
    source = ./xmonad/xmonad.hs;
    target = "/home/haam/.xmonad/xmonad.hs";
  };
  home.file.dpass = {
    source = ./xmonad/dpass;
    target = "/home/haam/.xmonad/dpass";
  };
  home.file.nixos-compile= {
    source = ./xmonad/nixos-compile;
    target = "/home/haam/.xmonad/nixos-compile";
  };
}
