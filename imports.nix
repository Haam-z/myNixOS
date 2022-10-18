{ config, lib, pkgs, ... }:

{
  imports = [  ./hardware-configuration.nix ./system/boot ./system/nix ./system/services ./system/user ./system/network.nix ./system/packages ./system/desktops ./system/services ./system/fonts ];

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Africa/Tunis";
}
