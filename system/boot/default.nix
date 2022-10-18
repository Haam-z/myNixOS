{ config, lib, pkgs, ... }:

{
  imports = [ ./kernel/kernel.nix ./grub/grub.nix];
}
