{ ... }: {
  gtk = {
    enable = true;
    catppuccin = {
      # TODO: this is deprecated
      # https://github.com/catppuccin/gtk/issues/262
      enable = true;
      flavor = "mocha";
      accent = "pink";
      size = "standard";
      tweaks = [ "normal" ];
    };
  };
}
