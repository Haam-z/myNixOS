{ config, lib, pkgs, ... }:

{
  home.file.spicetify = {
    source = ./spicetify;
    target = "/home/haam/.config/spicetify";
  };
}
