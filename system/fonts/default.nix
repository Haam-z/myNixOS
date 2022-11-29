{ config, pkgs, ... }:
{
  fonts = {
    fontconfig.enable = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [corefonts    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; }) dejavu_fonts fira-code inconsolata source-han-sans-japanese source-han-sans-korean source-han-sans-simplified-chinese source-han-sans-traditional-chinese ubuntu_font_family];};

}