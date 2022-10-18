{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      videoDrivers = [ "intel" ];
      enable = true;
      layout = "us";
    };
  };
  hardware = {opengl.driSupport32Bit = true;};
}
