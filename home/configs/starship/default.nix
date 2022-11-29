{ config, lib, pkgs, ... }:

{
  home.file.starship = {
    source = ./starship.toml ;
    target = "/home/haam/.config/starship.toml";
  };
}
