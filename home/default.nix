{ config, pkgs, ... }:
{
  imports = [./packages ./configs];
  home.stateVersion = "22.05";
}
