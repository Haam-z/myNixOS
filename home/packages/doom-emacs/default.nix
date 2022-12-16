{ pkgs, ... }:

let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = https://github.com/nix-community/nix-doom-emacs/archive/da227e13707789198870deb3222af0f5f12b475d.tar.gz;
    sha256 = "0a1rpjzy3zf0v6zqwpm744mhfr03fsz5ndgkm12cfi16wi77ycc1";
  }) {
    doomPrivateDir = ./doom.d;  # Directory containing your config.el init.el
                                # and packages.el files
  };
in {
 home.packages = [ doom-emacs ];
}
