{ config, lib, pkgs, ... }:

{
  services.xserver.displayManager.sddm = {
    enable = true;
  };
}
