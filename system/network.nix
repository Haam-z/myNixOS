{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "NixOs";
    networkmanager.enable = true;
  };
}
