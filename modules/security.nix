{...}:
{
  services = {
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };
  };
  security = {
    rtkit.enable = true;
    sudo.enable = true;
  };
}
