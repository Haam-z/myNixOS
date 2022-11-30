{ config, lib, pkgs, ... }:

{
  home.file.wallpaper = {
    source = ./wallpaper ;
    target = "/home/haam/.config/wallpaper" ;
  };
}
