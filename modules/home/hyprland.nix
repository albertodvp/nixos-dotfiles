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
      workspace = [
        "6, monitor:desc:Ancor Communications Inc VG248 D5LMQS005736, default:true"
        "1, monitor:desc:Ancor Communications Inc VG248 G9LMQS034586, default:true"
        "10, monitor:eDP-1, default:true"
      ];
      animation = [
        "windows, 1, 2, default"
        "workspaces, 1, 2, default, fade"
      ];
      monitor = [
        "desc:Ancor Communications Inc VG248 D5LMQS005736, preferred, -1920x0, 1"
        "desc:Ancor Communications Inc VG248 G9LMQS034586, preferred, 0x0, 1"
        "eDP-1, preferred, 1920x0, 1"
      ];
      bind =
        [
          "$mod, return, exec, alacritty"
          "$mod, b, exec, vivaldi"
          "$mod, p, exec, wofi --show=drun"
          "$mod, k, movefocus, u"
          "SUPER_SHIFT, k, movewindow, u"
          "$mod, j, movefocus, d"
          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, q, focusmonitor, desc:Ancor Communications Inc VG248 D5LMQS005736"
          "$mod, w, focusmonitor, desc:Ancor Communications Inc VG248 G9LMQS034586"
          "$mod, e, focusmonitor, eDP-1"
          "SUPER_SHIFT, q, movecurrentworkspacetomonitor, desc:Ancor Communications Inc VG248 D5LMQS005736"
          "SUPER_SHIFT, w, movecurrentworkspacetomonitor, desc:Ancor Communications Inc VG248 G9LMQS034586"
          "SUPER_SHIFT, e, movecurrentworkspacetomonitor, eDP-1"
          "SUPER_SHIFT, c, killactive"
          "SUPER_SHIFT, j, movewindow, d"
          "SUPER_SHIFT, h, movewindow, l"
          "SUPER_SHIFT, l, movewindow, r"
          "SUPER_SHIFT, Escape, exit"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList
            (
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
            )
            10)
        );
    };
  };
}
