{ pkgs, ... }:
{
  # Fix for Intel iwlwifi connection drops
  boot.extraModprobeConfig = ''
    options iwlwifi power_save=0 11n_disable=1
  '';
  networking = {
    nameservers = [
      "1.1.1.1"
      "9.9.9.9"
    ];
    hostName = "nixos";
    networkmanager = {
      enable = true;
      wifi.powersave = false; # Disable WiFi power saving
      plugins = [
        pkgs.networkmanager-openvpn
      ];
    };
    firewall.enable = true;
    extraHosts = ''
      127.0.0.1 dev.domain
    '';
    useDHCP = false;
    interfaces.wlp0s20f3.useDHCP = true;
  };
}
