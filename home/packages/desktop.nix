{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ alacritty arandr cinnamon.nemo discord emacs firefox flameshot libreoffice-fresh mailspring pavucontrol spotify tor-browser-bundle-bin virt-manager vlc zathura];
}
