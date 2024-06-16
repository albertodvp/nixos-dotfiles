{ home-manager, ... }: {
  imports = [
    home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.albertodvp = {
      home.stateVersion = "24.05";
      imports = [
        ./direnv.nix
        ./git.nix
        ./helix.nix
        ./hypridle.nix
        ./hyprland.nix
        ./hyprpaper.nix
        ./hyprlock.nix
        ./obs-studio.nix
        ./packages.nix
        ./waybar
        ./wofi.nix
        ./zoxide.nix
        ./zsh.nix
      ];
    };
  };
}
