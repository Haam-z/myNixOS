{ config, lib, pkgs,... }:
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
    (dmenu.overrideAttrs (oldAttrs: rec {patches = [./dmenu/patch.diff ];}))
    rofi
    xdotool
  ];
}
