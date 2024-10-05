{ pkgs, ... }:
{
  time.timeZone = "Europe/Rome";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    udev.packages = [
      pkgs.bazecor
      pkgs.calibre
    ];
    ntp.enable = true;
    libinput.enable = true;
    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      wireplumber = {
        enable = true;
        extraConfig = {
          "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msbc" = true;
            "bluez5.enable-hw-volume" = true;
            "bluez5.roles" = [
              "hsp_hs"
              "hsp_ag"
              "hfp_hf"
              "hfp_ag"
            ];
          };
        };
      };
    };
  };
  programs = {
    hyprland.enable = true;
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
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
        "Hack"
      ];
    })
  ];
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  system.stateVersion = "24.05";
}
