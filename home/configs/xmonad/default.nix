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
}
