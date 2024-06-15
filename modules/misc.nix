{ pkgs, ... }:
{
  time.timeZone = "Europe/Rome";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    displayManager.sddm.wayland.enable = true;
    udev.packages = [ pkgs.bazecor pkgs.calibre ];
    ntp.enable = true;
    libinput.enable = true;
  };
  programs = {
    zsh.enable = true;
    slock.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      bazecor
      curl
      git
      nodejs
      vim
    ];
    sessionVariables = rec {
      LIBVA_DRIVER_NAME = "iHD";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
      XDG_BIN_HOME = "$HOME/.local/bin";
      PATH = [
        "${XDG_BIN_HOME}"
      ];
      WORKON_HOME = "$HOME/.virtualenvs";
    };
  };
  fonts.packages = with pkgs; [
    hasklig
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })
  ];
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  system.stateVersion = "24.05";
}
