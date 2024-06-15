{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      monitor = [
        "desc:Ancor Communications Inc VG248 G9LMQS034586, preferred, 0x0, 1"
        "desc:Ancor Communications Inc VG248 D5LMQS005736, preferred, -1920x0, 1"
        "eDP-1, preferred, 1920x0, 1"
      ];
      bind =
        [
          "$mod, return, exec, alacritty"
          "$mod, b, exec, vivaldi"
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
