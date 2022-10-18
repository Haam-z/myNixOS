{ config, lib, pkgs, ... }:

{
  nixpkgs = {
    config.allowUnfree = true;
    system = "x86_64-linux";};
}
