{ ... }:
{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        enableCryptodisk = true;
      };
    };
    initrd.luks.devices = {
      luksroot = {
        device = "/dev/disk/by-uuid/f0d84c63-74a3-4d84-b75e-c3428254ff70";
        preLVM = true;
        allowDiscards = true;
      };
    };
    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
      kernelModules = [ "dm-snapshot" ];
    };
    kernelModules = [ ];
    extraModulePackages = [ ];
  };
}
