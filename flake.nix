{
  description = "A simple NixOS flake";
  inputs = {
    catppuccin.url = "github:catppuccin/nix";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    git-hooks.url = "github:cachix/pre-commit-hooks.nix";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-ai-tools.url = "github:numtide/nix-ai-tools";

  };
  outputs =
    inputs:
    let
      system = "x86_64-linux";
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ system ];
      imports = [
        ./checks.nix
        ./shell.nix
      ];
      flake = {
        nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = inputs // {
            inherit system;
          };
          modules = [
            ./modules/displayManager.nix
            ./modules/boot.nix
            ./modules/cachix.nix
            ./modules/hardware.nix
            ./modules/misc.nix
            ./modules/networking.nix
            ./modules/nix.nix
            ./modules/security.nix
            ./modules/users.nix
            ./modules/home
            { nixpkgs.hostPlatform = system; }
          ];
        };
      };
    };
}
