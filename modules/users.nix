{ pkgs, ... }:
let
  myself = "albertodvp";
in
{
  users = {
    mutableUsers = false;
    groups.libvirtd.members = [ myself ];
    users.${myself} = {
      shell = pkgs.zsh;
      isNormalUser = true;
      home = "/home/albertodvp";
      extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
        "jackaudio"
        "docker"
        "libvirtd"
        "vboxusers"
      ];
      hashedPassword = "$y$j9T$NGM/rXNI6rjkKBwPjBUwE0$deUHWy.aY4AQoUmJKOTWVtLoalNXj.HxeQw8pq9YBh2";
    };
  };
}
