{ config, pkgs, ... }:
{
  boot.loader.grub = {
        enable = true;
        devices = [ "nodev" ];
        efiInstallAsRemovable = true;
        efiSupport = true;
        extraEntries = ''menuentry "Reboot" {reboot} menuentry "Poweroff" {halt} '';
  };
}
