{ config, lib, pkgs, home-manager, ... }:

{
  users = {
    extraUsers.haam = {
      extraGroups = [ "wheel" "audio" "video" "libvirtd" "networkmanager" "docker" ];
      description = "Hamza Zarrouk";
      useDefaultShell = true;
      isNormalUser = true;
      createHome = true;
    };
    defaultUserShell = pkgs.fish;
  };
}
