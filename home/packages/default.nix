{ config, pkgs, ... }:
{
  imports = [./cli.nix ./desktop.nix ./development.nix ./window-manager.nix ];

}
