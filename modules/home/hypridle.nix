{
  services = {
    hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
          before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
          after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
        };

        listener1 = {
          timeout = 150; # 2.5min
          on_timeout = "brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
          on_resume = "brightnessctl -r"; # monitor backlight restore.
        };

        listener2 = {
          timeout = 150; # 2.5min
          on_timeout = "brightnessctl -sd rgb:kbd_backlight set 0"; # turn off keyboard backlight.
          on_resume = "brightnessctl -rd rgb:kbd_backlight"; # turn on keyboard backlight.
        };

        listener3 = {
          timeout = 300; # 5min
          on_timeout = "loginctl lock-session"; # lock screen when timeout has passed.
        };

        listener4 = {
          timeout = 330; # 5.5min
          on_timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed.
          on_resume = "hyprctl dispatch dpms on"; # screen on when activity is detected after timeout has fired.
        };
      };
    };
  };
}
