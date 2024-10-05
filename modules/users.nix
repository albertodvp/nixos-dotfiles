{ pkgs, ... }:
{
  users = {
    mutableUsers = false;
    users.albertodvp = {
      shell = pkgs.zsh;
      isNormalUser = true;
      home = "/home/albertodvp";
      extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
        "jackaudio"
        "docker"
      ];
      hashedPassword = "$y$j9T$NGM/rXNI6rjkKBwPjBUwE0$deUHWy.aY4AQoUmJKOTWVtLoalNXj.HxeQw8pq9YBh2";
    };
  };
}
