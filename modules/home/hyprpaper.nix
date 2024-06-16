{ ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = true;
      splash_offset = 2.0;

      preload = [
        "${./../../wallpapers/nixos-wallpaper-catppuccin-mocha.png}"
      ];

      wallpaper = [
        ",${./../../wallpapers/nixos-wallpaper-catppuccin-mocha.png}"
      ];
    };
  };
}
