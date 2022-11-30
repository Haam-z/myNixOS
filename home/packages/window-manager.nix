{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    dunst
    eww
    feh
    haskellPackages.greenclip
    lxappearance
    pamixer
    picom
    polybar
    rofi
    xdotool
  ];
}
