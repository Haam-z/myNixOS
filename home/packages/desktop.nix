{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    ani-cli
    alacritty
    arandr
    cinnamon.nemo
    firefox
    flameshot
    libreoffice-fresh
    mailspring
    pavucontrol
    tor-browser-bundle-bin
    virt-manager
    vlc
    zathura
  ];
}
