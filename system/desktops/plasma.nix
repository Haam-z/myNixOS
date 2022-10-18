{ config, lib, pkgs, ... }:

{
  services.xserver.desktopManager.plasma5 = {
    enable = true;
  };
}
