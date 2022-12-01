{ config, lib, pkgs, ... }:

{
  services.xserver.windowManager = {
    xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = hpkgs: [ hpkgs.xmonad hpkgs.xmonad-contrib hpkgs.xmonad-extras ]; };
  };
}
