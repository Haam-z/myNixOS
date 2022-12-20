{ config, lib, pkgs, ... }:

{
  home.file.scripts = {
    source = ./xmonad/scripts ;
    target = "/home/haam/.xmonad/scripts";
  };
  home.file.xmoand = {
    source = ./xmonad/xmonad.hs;
    target = "/home/haam/.xmonad/xmonad.hs";
  };
}
