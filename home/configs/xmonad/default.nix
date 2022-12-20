{ config, lib, pkgs, ... }:

{
  home.file.xmoand = {
    source = ./xmonad;
    target = "/home/haam/.xmonad";
  };
}
