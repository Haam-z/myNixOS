{ config, lib, pkgs, ... }:

{
  home.file.xmonad = {
    source = ./xmonad.hs ;
    target = "/home/haam/.xmonad/xmonad.hs";
  };
}
