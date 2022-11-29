{ config, lib, pkgs, ... }:

{
  home.file.mpv = {
    source = ./mpv ;
    target = "/home/haam/.config/mpv" ;
  };
}
