{ config, lib, ... }:
{
  home.file.btop = {
    source = ./btop.conf;
    target = "/home/haam/.config/btop/btop.conf";
  };
}
