{ pkgs, ... }:

let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = https://github.com/nix-community/nix-doom-emacs/archive/master.tar.gz;
    sha256 = "1ha3lwpxd72hqz8dll0vx1qva0h9q6yqi0h66szrv69sg2kdi0px";
  }) {
  };
in {
  doomPrivateDir = ./doom.d;
  home.packages = [ doom-emacs ];
}
