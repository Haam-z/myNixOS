{ config, lib, pkgs, ... }:


{
  home.packages = with pkgs; [ani-cli alacritty arandr cinnamon.nemo discord firefox flameshot libreoffice-fresh mailspring pavucontrol spotify tor-browser-bundle-bin virt-manager vlc zathura];
}
