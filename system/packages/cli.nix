{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    starship
    killall
    neovim
    file
    git
    btop
    exa
    xcp
    ripgrep
    bat
    dmenu
    home-manager
    networkmanager
    unzip
    wget
    libnotify
    zip
  ];
}
