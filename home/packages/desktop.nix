{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) ["spotify" "spotify-unrapped"];
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
    spotify
    tor-browser-bundle-bin
    virt-manager
    vlc
    zathura
  ];
}
