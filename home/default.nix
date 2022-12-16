{ config, pkgs, ... }:
{
  imports = [./packages ./configs];
  home.stateVersion = "22.05";
  home.username = "haam";
  home.homeDirectory = "/home/haam";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
