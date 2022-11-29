{ config, pkgs, ... }:

{
  imports = [  ./hardware-configuration.nix ./network.nix ./boot ./nix ./services ./user ./desktops ./services ./fonts ];
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "22.05";
  time.timeZone = "Africa/Tunis";
}
