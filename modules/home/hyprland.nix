{ ... }:
{
  wayland.windowManager.hyprland = {
    xwayland.enable = true;
    enable = true;
    settings = {
      "$mod" = "SUPER";
      input = {
        repeat_delay = 200;
        repeat_rate = 60;
      };
      animation = [
        "windows, 1, 2, default"
        "workspaces, 1, 2, default, fade"
      ];
      monitor = [
        "eDP-1, preferred, 0x0, 1"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bind =
        [
          "$mod, t, exec, alacritty"
          "$mod, b, exec, firefox"
          "$mod, p, exec, wofi --show=drun --allow-images"
          "$mod, s, exec, grim -g \"$(slurp)\" - | swappy -f -"
          "$mod, k, movefocus, u"
          "$mod, j, movefocus, d"
          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, f, toggleFloating"
          "SUPER_SHIFT, COMMA, killactive"
          "SUPER_SHIFT, j, movewindow, d"
          "SUPER_SHIFT, k, movewindow, u"
          "SUPER_SHIFT, h, movewindow, l"
          "SUPER_SHIFT, l, movewindow, r"
          "SUPER_SHIFT, f, fullscreen"
          "SUPER_SHIFT, x, exit"
          "SUPER_SHIFT, t, togglegroup"
          "SUPER_SHIFT, g, changegroupactive"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (
            builtins.genList (
              x:
              let
                ws =
                  let
                    c = (x + 1) / 10;
                  in
                  builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            ) 10
          )
        );
    };
  };
}
