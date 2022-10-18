{ config, lib, pkgs, ... }:

{
  imports = [./flatpak.nix ./xserver/pipewire.nix ./xserver/libinput.nix ./xserver/default.nix ./display-manager.nix ./bluetooth.nix ./Virtulations/docker.nix ./Virtulations/libvrit.nix];
}
