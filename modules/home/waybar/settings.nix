{ ... }:
{
  programs.waybar.settings.mainBar = {
    output = [
      "eDP-1"
      "HDMI-A-1"
      "DP-6"
    ];
    position = "top";
    layer = "top";
    height = 30;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [
      "hyprland/workspaces"
    ];
    modules-center = [
      "clock"
    ];
    modules-right = [
      "tray"
      "cpu"
      "memory"
      "disk"
      "pulseaudio"
      "battery"
      "network"
    ];
    clock = {
      calendar = {
        format = {
          today = "<span color='#b4befe'><b><u>{}</u></b></span>";
        };
      };
      format = " {:%H:%M}";
      tooltip = "true";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = " {:%d/%m}";
    };
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        sort-by-number = true;
      };
    };
    memory = {
      format = "󰟜 {}%";
      format-alt = "󰟜 {used} GiB"; # 
      interval = 2;
    };
    cpu = {
      format = "  {usage}%";
      format-alt = "  {avg_frequency} GHz";
      interval = 2;
    };
    disk = {
      format = "󰋊 {percentage_used}%";
      interval = 60;
    };
    network = {
      format-wifi = "  {signalStrength}%";
      format-ethernet = "󰀂 ";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "󰖪 ";
    };
    tray = {
      icon-size = 20;
      spacing = 10;
    };
    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "󰖁  {volume}%";
      format-icons = {
        default = [ " " ];
      };
      scroll-step = 5;
    };
    battery = {
      format = "{icon} {capacity}%";
      format-icons = [
        " "
        " "
        " "
        " "
        " "
      ];
      format-charging = " {capacity}%";
      format-full = " {capacity}%";
      format-warning = " {capacity}%";
      interval = 5;
      states = {
        warning = 20;
      };
      format-time = "{H}h{M}m";
      tooltip = true;
      tooltip-format = "{time}";
    };
  };
}
