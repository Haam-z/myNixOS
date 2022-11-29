{ config, lib, pkgs, ... }:

{
  home.file.picom = {
    source = ./picom.conf ;
    target = "/home/haam/.config/picom.conf" ;
  };
}
