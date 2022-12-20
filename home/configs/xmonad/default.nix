{ config, lib, pkgs, ... }:

{
  home.file.xmonad = {
    source = ./xmonad ;
    target = "/home/haam/.xmonad";
  };

}
