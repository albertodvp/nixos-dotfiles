{
  catppuccin,
  home-manager,
  pkgs,
  ...
}:
{
  catppuccin = {
    enable = true;
    flavor = "mocha";
  };
  imports = [
    home-manager.nixosModules.home-manager
    catppuccin.nixosModules.catppuccin
  ];
  programs.hyprland.enable = true;
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
      config.common.default = "*";
    };
  };

  environment.sessionVariables = {
    GTK_USE_PORTAL = "1";
  };
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.albertodvp = {
      catppuccin = {
        enable = true;
        flavor = "frappe";
      };
      home.stateVersion = "24.05";
      imports = [
        ./alacritty.nix
        ./atuin.nix
        ./direnv.nix
        ./dunst.nix
        ./git.nix
        ./gtk.nix
        ./helix.nix
        ./hypridle.nix
        ./hyprland.nix
        ./hyprpaper.nix
        ./hyprlock.nix
        ./lazygit.nix
        ./obs-studio.nix
        ./packages.nix
        ./waybar
        ./wofi.nix
        ./zoxide.nix
        ./zsh.nix
        catppuccin.homeManagerModules.catppuccin
      ];
    };
  };
}
