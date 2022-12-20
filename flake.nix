{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    devenv.url = "github:cachix/devenv/v0.4";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, devenv, ... }: {
    nixosConfigurations = {
      Nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [./system];
      };
    };
    homeConfigurations = {
      haam = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [
          ./home
        ];
      };
    };
  };
}
