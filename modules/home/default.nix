{ home-manager, ... }:{
  imports = [ home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.albertodvp = {
      home.stateVersion = "24.05";
      imports = [
        ./direnv.nix
        ./git.nix
        ./helix.nix
        ./packages.nix
        ./zoxide.nix
        ./zsh.nix
      ];
    };
  };
}
