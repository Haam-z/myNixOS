{ config, lib, pkgs, fetchFromGitHub , ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.system = "x86_64-linux";
}
