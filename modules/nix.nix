{ lib, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "unrar"
          "obsidian"
        ];
      packageOverrides = pkgs: {
        intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
      };
      hostPlatform = lib.mkDefault "x86_64-linux";
      permittedInsecurePackages = [
        "electron-27.3.11"
      ];
    };
  };
  nix.settings = {
    cores = 11;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://cache.iog.io"
    ];
    trusted-public-keys = [
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
    ];
  };
}
