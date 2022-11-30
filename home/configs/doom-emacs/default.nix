{ config, lib, pkgs, ... }:

{
  home.file."emacs-init" = {
    source = ./init.el;
    target = "/home/haam/.doom.d/init.el";
  };
  home.file."emacs-config" = {
    source = ./config.el;
    target = "/home/haam/.doom.d/config.el";
  };
  home.file."emacs-packages" = {
    source = ./packages;
    target = "/home/haam/.doom.d/packages.el";
  };
  home.file."emacs-custom" = {
    source = ./custom;
    target = "/home/haam/.doom.d/custom.el";

  };
}
