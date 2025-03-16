{ ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";

      preload = [
        "${./../../wallpapers/nixos-wallpaper-catppuccin-mocha.png}"
      ];

      wallpaper = [
        ",${./../../wallpapers/nixos-wallpaper-catppuccin-mocha.png}"
      ];
    };
  };
}
