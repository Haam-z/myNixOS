{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [alsa-utils bat brightnessctl btop exa fd file fzf gh git gnumake killall lf libnotify neofetch ripgrep starship unzip wget wmctrl xclip xcp youtube-dl zip];
}
