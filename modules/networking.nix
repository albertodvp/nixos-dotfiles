{ ... }:
{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = true;
    extraHosts = ''
      127.0.0.1 dev.domain
    '';
    useDHCP = false;
    interfaces.wlp0s20f3.useDHCP = true;

  };
}
