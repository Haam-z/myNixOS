{ config, lib, pkgs, ... }:

{
  users.extraUsers.haam.packages = with pkgs; [ nitrogen picom polybar vlc spotify youtube-dl libreoffice-fresh hunspell cinnamon.nemo haskellPackages.greenclip alacritty emacs neovide mailspring  firefox rofi ];
}
