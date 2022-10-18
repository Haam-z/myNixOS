{ config, lib, pkgs, ... }:

{
  services.xserver.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      scrollMethod = "twofinger";
      naturalScrolling = true;
      middleEmulation = true;
      clickMethod = "clickfinger";
    };
  };
}
