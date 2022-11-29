{ config, lib, ... }:
{
  programs.alacritty = {
    enable = true;
  };
  home.file.alacritty  = {
    source = ./alacritty.yml;
    target = "/home/haam/.config/alacritty.yml";
  };
}
