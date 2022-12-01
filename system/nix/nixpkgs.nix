{ config, lib, pkgs, fetchFromGitHub , ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    system = "x86_64-linux";
  };
}
