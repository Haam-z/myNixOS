{ config, pkgs, lib, ... }:

let
  ham-fonts = pkgs.callPackage ./haam-fonts/default.nix { };
in
{
  fonts = {
    fontconfig.enable = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = [ ham-fonts ];
  };
}
