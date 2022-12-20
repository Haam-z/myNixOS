{ config, lib, pkgs, ... }:

{
  home.file.scripts = {
    source = ./scripts ;
    target = "/home/haam/.xmonad/scripts";
  };
  home.file.xmoand = {
    source = ./xmonad.hs;
    target = "/home/haam/.xmonad/xmonad.hs";
  };
}
