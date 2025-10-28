{
  catppuccin,
  home-manager,
  pkgs,
  system,
  nix-ai-tools,
  ...
}:
{
  catppuccin = {
    enable = true;
    flavor = "frappe";
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
  environment = {
    sessionVariables = {
      GTK_USE_PORTAL = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      WORKON_HOME = "$HOME/.virtualenvs";
    };
  };
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit nix-ai-tools system; };
    users.albertodvp = {
      dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
          autoconnect = [ "qemu:///system" ];
          uris = [ "qemu:///system" ];
        };
      };
      catppuccin = {
        enable = true;
        flavor = "frappe";
      };
      home = {
        stateVersion = "24.05";
        pointerCursor = {
          name = "phinger-cursors-light";
          package = pkgs.phinger-cursors;
          size = 32;
          gtk.enable = true;
        };
      };
      imports = [
        ./alacritty.nix
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
        ./zellij.nix
        ./zsh.nix
        catppuccin.homeModules.catppuccin
      ];
    };
  };
}
