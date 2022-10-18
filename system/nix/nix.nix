{ config, lib, pkgs, ... }:

{
  nix = {
    package = pkgs.nixFlakes ;
    extraOptions = ''experimental-features = nix-command flakes'';
    trustedBinaryCaches = ["http://cache.nixos.org"];
    binaryCaches = ["http://cache.nixos.org"];
    gc.automatic = true;
  };
}
