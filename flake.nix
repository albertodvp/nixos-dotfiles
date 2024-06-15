{
  description = "A simple NixOS flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = inputs;
      system = "x86_64-linux";
      modules = [
        ./modules/boot.nix
        ./modules/cachix.nix
        ./modules/hardware.nix
        ./modules/misc.nix
        ./modules/networking.nix
        ./modules/nix.nix
        ./modules/security.nix
        ./modules/users.nix
        ./modules/home
      ];
    };
  };
}
