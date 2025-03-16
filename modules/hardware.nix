{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/a6e4bb6b-a35f-490c-90c9-fcaa7936ac85";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/4218-2A34";
      fsType = "vfat";
    };
  };
  swapDevices = [ { device = "/dev/disk/by-uuid/0877da40-b7fc-4492-950d-3e947caa2e51"; } ];

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    bluetooth.enable = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
        libvdpau-va-gl
      ];
    };
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        # your Open GL, Vulkan and VAAPI drivers
        vpl-gpu-rt # for newer GPUs on NixOS >24.05 or unstable
        # onevpl-intel-gpu  # for newer GPUs on NixOS <= 24.05
        # intel-media-sdk   # for older GPUs
      ];
    };
  };
}
