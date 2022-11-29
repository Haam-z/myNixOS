{ config, lib, pkgs, ... }:

{
  home.file.fish = {
    source = ./config.fish;
    target = "/home/haam/.config/fish/config.fish" ;
  };
}
