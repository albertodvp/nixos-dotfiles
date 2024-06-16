{
  description = "A simple NixOS flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    git-hooks.url = "github:cachix/pre-commit-hooks.nix";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        ./checks.nix
        ./shell.nix
      ];
      flake = {
        nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
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
    };
}
