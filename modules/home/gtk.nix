{ pkgs, ... }:
{
  gtk = {
    enable = true;
    catppuccin = {
      flavor = "mocha";
      accent = "pink";
      size = "standard";
      tweaks = [ "normal" ];
    };
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    font = {
      name = "Monoki Nerd Font Regular";
      size = 12;
    };
  };
}
