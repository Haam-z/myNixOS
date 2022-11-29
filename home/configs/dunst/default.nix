{ config, lib, pkgs, ... }:

{
  home.file.dunst = {
    source = ./dunst;
    target = "/home/haam/.config/dunst";
  };
}
