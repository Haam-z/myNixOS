{ config, lib, pkgs, ... }:

{
  home.file.polybar = {
    source = ./polybar ;
    target = "/home/haam/.config/polybar";
  };
}
